class Event {
  final String imagePath,
      title,
      description,
      location,
      duration,
      punchLine1,
      punchLine2;
  final List categoryIds, galleryImages;

  Event(
      {this.imagePath,
      this.title,
      this.description,
      this.location,
      this.duration,
      this.punchLine1,
      this.punchLine2,
      this.categoryIds,
      this.galleryImages});
}

final fiveKmRunEvent = Event(
    imagePath: "assets/event_images/5_km_downtown_run.jpeg",
    title: "5 Kilometer Downtown Run",
    description: "",
    location: "Pleasant Park",
    duration: "3h",
    galleryImages: [],
    categoryIds: [0, 2]);

final meetupEvent = Event(
  imagePath: "assets/event_images/support.jpg",
  title: "Local Support Group Meetup",
  description:
      "Guest list fill up fast so be sure to apply before handto secure a spot.",
  location: "Food Court Avenue,Rashtreet",
  duration: "2h",
  categoryIds: [0, 1],
);

final events = [
  fiveKmRunEvent,
  meetupEvent,
];
