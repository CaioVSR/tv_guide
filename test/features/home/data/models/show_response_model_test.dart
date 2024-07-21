import 'package:flutter_test/flutter_test.dart';
import 'package:tv_guide/features/home/data/models/show_response_model.dart';

void main() {
  group('ShowResponseModel', () {
    test('fromJson should return a valid model', () {
      final json = {
        'id': 1,
        'name': 'Test Show',
        'genres': ['Drama', 'Comedy'],
        'status': 'Running',
        'rating': {'average': 8.5},
        'image': {'medium': 'medium_url', 'original': 'original_url'},
        'summary': 'Test summary',
      };

      final model = ShowResponseModel.fromJson(json);

      expect(model.id, 1);
      expect(model.name, 'Test Show');
      expect(model.genres, ['Drama', 'Comedy']);
      expect(model.status, 'Running');
      expect(model.rating?.average, 8.5);
      expect(model.image?.medium, 'medium_url');
      expect(model.image?.original, 'original_url');
      expect(model.summary, 'Test summary');
    });

    test('fromJson should handle null values', () {
      final json = {
        'id': 1,
        'name': null,
        'genres': null,
        'status': null,
        'rating': null,
        'image': null,
        'summary': null,
      };

      final model = ShowResponseModel.fromJson(json);

      expect(model.id, 1);
      expect(model.name, null);
      expect(model.genres, null);
      expect(model.status, null);
      expect(model.rating, null);
      expect(model.image, null);
      expect(model.summary, null);
    });
  });

  group('RatingResponseModel', () {
    test('fromJson should return a valid model', () {
      final json = {'average': 8.5};

      final model = RatingResponseModel.fromJson(json);

      expect(model.average, 8.5);
    });

    test('fromJson should handle null values', () {
      final json = {'average': null};

      final model = RatingResponseModel.fromJson(json);

      expect(model.average, null);
    });
  });

  group('ImageResponseModel', () {
    test('fromJson should return a valid model', () {
      final json = {'medium': 'medium_url', 'original': 'original_url'};

      final model = ImageResponseModel.fromJson(json);

      expect(model.medium, 'medium_url');
      expect(model.original, 'original_url');
    });

    test('fromJson should handle null values', () {
      final json = {'medium': null, 'original': null};

      final model = ImageResponseModel.fromJson(json);

      expect(model.medium, null);
      expect(model.original, null);
    });
  });
}
