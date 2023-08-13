import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Commodo enim cupidatat sit incididunt.', 'assets/images/1.png'),
  SlideInfo('Entrega rapida', 'Pariatur amet occaecat voluptate est proident Lorem consectetur culpa aute tempor duis.', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Officia reprehenderit mollit tempor non mollit esse ea ipsum.', 'assets/images/3.png'),
];



class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      final page = pageController.page ?? 0;
      if(!endReached && page >= (slides.length - 1.5)){
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          
          PageView(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            children: slides.map(
              (slide) => _Slide(
                title: slide.title, 
                caption: slide.caption, 
                imageUrl: slide.imageUrl
              )
            ).toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Saltar', style: TextStyle(fontWeight: FontWeight.bold),),
              onPressed: () => context.pop(),
            ),
          ),

          endReached ?
            Positioned(
              bottom: 30,
              right: 30,
              child: FadeInRight(
                from: 15,
                delay: const Duration(milliseconds: 500),
                child: FilledButton(
                  onPressed: () {
                    
                  }, 
                  child: const Text('Comenzar')
                ),
              ),
            )
          : const SizedBox()
        ],
      ),
    );
  }
}


class _Slide extends StatelessWidget {
  
  final String title;
  final String caption;
  final String imageUrl;
  
  const _Slide({
    required this.title, 
    required this.caption, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(imageUrl),
              ),
              const SizedBox(height: 20,),
              Text(title, style: titleStyle,),
              const SizedBox(height: 10,),
              Text(caption, style: captionStyle,)
            ],
          ),
        ),
      ),
    );
  }
}