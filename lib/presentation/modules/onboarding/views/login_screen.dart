import 'package:base_project/app/export.dart';
import 'package:base_project/presentation/modules/splash/controllers/on_boarding_controller.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _pages = [
    Center(child: Text("Welcome to the App", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
    Center(child: Text("Discover Features", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
    Center(child: Text("Get Started Now!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
  ];

  void _onNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void _onSkip() {
    _pageController.jumpToPage(_pages.length - 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: _pages,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _onSkip,
                    child: Text("Skip"),
                  ),
                  ElevatedButton(
                    onPressed: _currentPage == _pages.length - 1 ? null : _onNext,
                    child: Text("Next"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

