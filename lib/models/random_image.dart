
class BreedImage {
    String message;
    String status;

    BreedImage({
        required this.message,
        required this.status,
    });

    factory BreedImage.fromMap(Map<String, dynamic> json) => BreedImage(
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "status": status,
    };
}
