import 'package:flutter/material.dart';
import 'package:finalproyecto/services/api_service.dart';

class VideosScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  VideosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Videos')),
      body: FutureBuilder<List<dynamic>>(
        future: apiService.fetchVideos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final videos = snapshot.data ?? [];
            return ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context, index) {
                final video = videos[index];
                return ListTile(
                  title: Text(video['titulo']),
                  subtitle: Text(video['descripcion']),
                  onTap: () {
                    // Aquí puedes usar un paquete como `video_player` para reproducir el video
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
