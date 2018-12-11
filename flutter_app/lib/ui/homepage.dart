import 'package:flutter/material.dart';
import 'package:flutter_app/common/api.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_app/components/RecommendCoach.dart';
import 'package:flutter_app/components/RecommendCourse.dart';
import 'package:flutter_app/common/base.dart';
import 'package:flutter_app/models/location.dart';
import 'package:flutter_app/models/banners.dart';
import 'package:flutter_app/models/recommend.dart';
import 'package:flutter_app/static/status.dart';

// -------------------------------- body-----------------------------
class HomeFragment extends Base {
  HomeFragment({Key k, @required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return HomeFragmentState();
  }
}

class HomeFragmentState extends BaseState<HomeFragment> {
  int _state = HomeStatus.INTI;

  City _dropSelect;
  List<City> _cityList = [];
  List<BannerItem> _banners = [];
  RecommendData _recommendData;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() async {
    var position = await Api.instance.GPS();
    if (position == null) {
      setState(() {
        _state = HomeStatus.GET_LOCATION_FAIL;
      });
      return;
    }

    var location =
        await Api.instance.getLocation(position.latitude, position.longitude);
    if (location.code == 0) {
      setState(() {
        _dropSelect = location.data.curr;
        _cityList = location.data.list;
        _getContentData();
      });
    } else {
      setState(() {
        _state = HomeStatus.GET_LOCATION_FAIL;
      });
    }
  }

  void _getContentData() async {
    var repBanner = await Api.instance.getBanners();
    if (repBanner != null) {
      _banners = repBanner.data;
    } else {
      setState(() {
        _state = HomeStatus.GET_CONTENT_FAIL;
      });
      return;
    }

    var position = await Api.instance.GPS();
    if (position == null) {
      setState(() {
        _state = HomeStatus.GET_CONTENT_FAIL;
      });
      return;
    }

    var repRecommend = await Api.instance.getRecommend(
        '', _dropSelect.code, position.latitude, position.longitude);
    if (repRecommend.code == 0) {
      _recommendData = repRecommend.data;
    } else {
      setState(() {
        _state = HomeStatus.GET_CONTENT_FAIL;
      });
      return;
    }

    setState(() {
      _state = HomeStatus.GET_CONTENT_SUCC;
    });
  }

  void _dropDownChanged(City v) {
    setState(() {
      _dropSelect = v;
    });
  }

  Widget _buildStatusPlace() {
    return Container(
      height: MediaQuery.of(context).padding.top,
    );
  }

  Widget _buildTitle() {
    return Container(
      constraints: BoxConstraints.expand(
        height: 44,
      ),
      alignment: Alignment.center,
      child: Text(
        widget.title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
    );
  }

  Widget _buildScanAndDropDown() {
    return Container(
      constraints: BoxConstraints.expand(height: 42),
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 8, top: 4),
      child: Row(
        children: <Widget>[
          DropdownButton(
              iconSize: 0,
              items: _cityList.map((City v) {
                return DropdownMenuItem(
                  child: Text(
                    v.name,
                    style: TextStyle(fontSize: 14),
                  ),
                  value: v,
                );
              }).toList(),
              hint: Row(
                children: <Widget>[
                  Text(
                    _dropSelect == null ? '定位中' : _dropSelect.name,
                    maxLines: 3,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Icon(Icons.expand_more)
                ],
              ),
              onChanged: _dropDownChanged),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 15),
              height: 30,
              decoration: BoxDecoration(
                  color: Color(0xFF02B19A),
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: TextField(
                style: TextStyle(fontSize: 13, height: 1.0),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  prefixIcon: Icon(Icons.search),
                  hintText: '输入关键字',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildStatusPlace(),
            _buildTitle(),
            _buildScanAndDropDown(),
          ],
        ));
  }

  Widget _buildSwiper() {
    return Container(
      constraints: BoxConstraints.expand(height: 145),
      child: Swiper(
        itemCount: _banners.length,
        loop: true,
        index: 0,
        autoplay: true,
        itemBuilder: (BuildContext context, int i) {
          return AspectRatio(
            aspectRatio: 375 / 145,
            child: Image.network(
              _banners[i].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                color: Colors.grey,
                activeColor: Colors.white,
                activeSize: 5,
                size: 5)),
      ),
    );
  }

  Column _buildButtonColumn(IconData icon, String labe1) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          radius: 22,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4.0),
          child: Text(
            labe1,
            style: TextStyle(fontSize: 13.0),
          ),
        )
      ],
    );
  }

  Widget _buildCourseButton() {
    return Container(
      margin: EdgeInsets.only(top: 13, bottom: 14, left: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildButtonColumn(Icons.call, '团课'),
          _buildButtonColumn(Icons.near_me, '私教'),
          _buildButtonColumn(Icons.share, '医健'),
          _buildButtonColumn(Icons.share, '套课'),
        ],
      ),
    );
  }

  SliverGrid _buildGymGrid() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              child: AspectRatio(
                aspectRatio: 168 / 110,
                child: Image.asset(
                  'images/lake.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 9,
              ),
              child: Text('三迪中心店'),
            )
          ],
        );
      }, childCount: 2),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        childAspectRatio: 168 / 152,
      ),
    );
  }

  SliverList _buildRecommendList() {
    return SliverList(
        delegate: SliverChildListDelegate(<Widget>[
      RecommendCourse(
          _recommendData.league.length > 0 ? _recommendData.league[0] : null),
      RecommendCoach(
          _recommendData.pt.length > 0 ? _recommendData.pt[0] : null),
    ]));
  }

  Widget _buildContent() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              _buildSwiper(),
              _buildCourseButton(),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: NearGymHeader(),
        ),
//        SliverPersistentHeader(
//            delegate: _SliverAppBarDelegate(
//                minHeight: 50, maxHeight: 50, child: NearGymHeader())),
        SliverPadding(
          padding: EdgeInsets.only(left: 16, right: 16),
          sliver: _buildGymGrid(),
        ),
        SliverToBoxAdapter(child: RecommendHeader(context)),
        SliverPadding(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          sliver: _buildRecommendList(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var content;
    switch (_state) {
      case HomeStatus.GET_CONTENT_SUCC:
        content = _buildContent();
        break;
      case HomeStatus.GET_LOCATION_FAIL:
        content = buildLoadFail(() {
          _initData();
        });
        break;
      case HomeStatus.GET_CONTENT_FAIL:
        content = buildLoadFail(() {
          _getContentData();
        });
        break;
      default:
        content = buildLoading();
        break;
    }
    return Column(
      children: <Widget>[_buildHeader(), Expanded(child: content)],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class NearGymHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 1,
            color: Color(0xffe1e1e1),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 13, bottom: 12),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "附近的店",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: null,
                  child: Text(
                    '全部 >',
                    style: TextStyle(fontSize: 13, color: Color(0xffB6B7B7)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --------------------------------recommend -----------------------------

class RecommendHeader extends Column {
  RecommendHeader(BuildContext this.context);

  var context;

  @override
  List<Widget> get children => [
        Container(
          height: 1,
          color: Color(0xffe1e1e1),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 13, left: 16, bottom: 14),
          child: Text(
            '为你精选',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        )
      ];
}
