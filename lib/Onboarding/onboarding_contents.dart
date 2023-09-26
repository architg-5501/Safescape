class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    this.title,
    this.image,
    this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Your safety , Our priority",
    image: "assets/safescapelogo.png",
    desc: "Notify your Safety with a single tap.",
  ),
  // OnboardingContents(
  //   title: "Personalized Conversational AI Assistant",
  //   image: "assets/54960780.png",
  //   desc:
  //   "Your Empathetic Companion!!\nYou can tap on the assistant and say 'HELLO' to get it introduced to you",
  // ),
  OnboardingContents(
    title: "One-Touch Live Alerts!",
    image: "assets/alert.png",
    desc:
        "Share immediate alerts and your live location with loved ones effortlessly.",
  ),
  OnboardingContents(
    title: "Shake Sensing Technology",
    image: "assets/shakeme.png",
    desc: "Stay protected with Safescape's shake-based alert detection system.",
  ),
  OnboardingContents(
    title: "Help at your fingertips",
    image: "assets/safewomen.png",
    desc:
        "With Safescape, help is always within your reach, ready to be accessed with a simple touch.",
  ),
  OnboardingContents(
    title: "Automated Location Updates",
    image: "assets/liv.png",
    desc:
        "Use periodic location updates as convenient check-ins for your loved ones.",
  ),
  OnboardingContents(
    title: "Spy Camera Detector",
    image: "assets/spying.png",
    desc:
        "Defend your personal space with Safescape's spy camera detection using cutting-edge sensors.",
  ),
  OnboardingContents(
    title: "Connected for Safer Journeys",
    image: "assets/walking.png",
    desc:
        "AWith safety at your fingertips, always stay connected and ready to defend yourself while walking!",
  ),
];
