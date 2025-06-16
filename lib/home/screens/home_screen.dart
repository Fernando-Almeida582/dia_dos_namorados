import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../common/colors/colors.dart';
import '../../common/images_list/images.dart';
import '../../gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  late Timer _timerTime;
  late Timer _timerImage;
  late Duration _difference;
  late int years;
  late int days;
  late int hours;
  late int minutes;
  late int seconds;
  final DateTime startDate = DateTime(2022, 2, 15);
  bool isPlaying = false;
  final player = AudioPlayer();
  int _currentIndex = 0;

  void _toggleMusic() async {
    if (isPlaying) {
      await player.pause();
    } else {
      await player.setSourceAsset('musics/little_talks.mp3');
      await player.resume();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  final int numberOfHearts = 10;
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  late List<double> _startPositions;

  @override
  void initState() {
    super.initState();

    _calculateDifference();
    _timerTime = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _calculateDifference();
      });
    });

    WidgetsBinding.instance.addObserver(this);

    _controllers = List.generate(
      numberOfHearts,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 3000 + index * 300),
      ),
    );

    _animations = _controllers
        .map(
          (controller) => Tween<double>(
            begin: 0,
            end: 1,
          ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut)),
        )
        .toList();

    _startPositions = List.generate(
      numberOfHearts,
      (index) => (index + 0) / (numberOfHearts + 1),
    );
    for (var i = 0; i < numberOfHearts; i++) {
      Future.delayed(Duration(milliseconds: i * 500), () {
        if (mounted) {
          _controllers[i].repeat();
        }
      });
    }
    _timerImage = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % ImagesList.images.length;
      });
    });
  }

  @override
  void dispose() {
    _timerImage.cancel();
    _timerTime.cancel();
    WidgetsBinding.instance.removeObserver(this);
    for (var controller in _controllers) {
      controller.dispose();
    }
    player.dispose();
    super.dispose();
  }

  void _calculateDifference() {
    final now = DateTime.now();

    years = now.year - startDate.year;
    DateTime anniversaryThisYear = DateTime(
      startDate.year + years,
      startDate.month,
      startDate.day,
    );

    if (now.isBefore(anniversaryThisYear)) {
      years--;
      anniversaryThisYear = DateTime(
        startDate.year + years,
        startDate.month,
        startDate.day,
      );
    }
    _difference = now.difference(anniversaryThisYear);

    days = _difference.inDays;
    hours = _difference.inHours % 24;
    minutes = _difference.inMinutes % 60;
    seconds = _difference.inSeconds % 60;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      if (isPlaying) {
        player.stop();
        setState(() => isPlaying = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        width: size.width,
        height: size.height,
        color: AppColors.backgroundColors[_currentIndex],
        child: SafeArea(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        color: AppColors.cardColors[_currentIndex],
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  Assets.images.capaLittleTalks.path,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Little Talks',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            AppColors.iconColors[_currentIndex],
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                    Text(
                                      'Of Monster and Men',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors
                                            .iconColors[_currentIndex]
                                            .withValues(alpha: 0.7),
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  isPlaying
                                      ? Icons.pause_circle_filled
                                      : Icons.play_circle_fill,
                                  size: 40,
                                  color: AppColors.iconColors[_currentIndex],
                                ),
                                onPressed: _toggleMusic,
                              ),
                            ],
                          ),
                        ),
                      ),

                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 600),

                        child: Container(
                          margin: EdgeInsets.only(
                            bottom: 16,
                            top: 16,
                            left: 16,
                            right: 16,
                          ),
                          width: size.width,
                          height: size.height * 0.6,
                          key: ValueKey<int>(_currentIndex),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(ImagesList.images[_currentIndex]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AppColors.borderColors[_currentIndex],
                              width: 5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.3),
                                blurRadius: 8,
                                offset: Offset(2, 4),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 0, right: 0),
                        child: Text(
                          "❤️ Eu te amo a: ",
                          style: TextStyle(
                            color: AppColors.textColors[_currentIndex],
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Roboto',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          '$years anos  $days dias  $hours horas  $minutes minutos e $seconds segundos',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.textColors[_currentIndex],
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      Divider(color: AppColors.textColors[_currentIndex]),
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          'Meu amor, saiba que você é a coisa mais linda e importante da minha vida, eu te amo demais',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.textColors[_currentIndex],
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ...List.generate(numberOfHearts, (index) {
                  return AnimatedBuilder(
                    animation: _controllers[index],
                    builder: (context, child) {
                      final progress = _animations[index].value;

                      final left = size.width * _startPositions[index];
                      final bottom = -50 + (size.height + 100) * progress;

                      return Positioned(
                        left: left,
                        bottom: bottom,
                        child: Opacity(
                          opacity: 1 - progress,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.pinkAccent.withValues(alpha: 0.7),
                            size: 24 * (1 - progress) + 12,
                          ),
                        ),
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
