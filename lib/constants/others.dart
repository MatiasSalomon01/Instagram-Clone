import 'dart:math';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:word_generator/word_generator.dart';

const String defaultProfilePicture = 'assets/defaultProfilePicture.jpg';

const Map<int, String> calendar = {
  1: 'Enero',
  2: 'Febrero',
  3: 'Marzo',
  4: 'Abril',
  5: 'Mayo',
  6: 'Junio',
  7: 'Julio',
  8: 'Agosto',
  9: 'Septiembre',
  10: 'Octubre',
  11: 'Noviembre',
  12: 'Diciembre',
};

final SupabaseClient supabase = Supabase.instance.client;
const String supabaseUrl = 'https://mbwhdiecorkyqgjsjldz.supabase.co';
const String anonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1id2hkaWVjb3JreXFnanNqbGR6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDUzNjAzMDgsImV4cCI6MjAyMDkzNjMwOH0.TcpZQ5FR1U03kZpGXK8F2IazuNApRl05ZVbZ2JSV6c0';

const String authority = 'api.pexels.com';
const Map<String, String> headers = {
  'Authorization': 'c9P0gvk7SKSG0ypDARLPKSEHUEnNJJNAFvGwHnjoabJZLAzn3m9iEzT5'
};
final List<String> queryWords = [
  'nature',
  'landscape',
  'high resolution',
  'beautiful',
  'cars',
  'sunset',
  'sky',
  'night',
  'galaxy',
  'planets',
  'paint',
  'art',
  'girls',
  'sports',
  'beer',
  'food',
  'black',
  'blue',
  'movies',
  'tv shows',
  'music'
];
final List<String> colorWords = [
  'red',
  'orange',
  'yellow',
  'green',
  'turquoise',
  'blue',
  'violet',
  'pink',
  'brown',
  'black',
  'gray',
  'white'
];

final random = Random();
final wordGenerator = WordGenerator();
