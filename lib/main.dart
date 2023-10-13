import 'package:almost_zenly/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//Firebase の初期化
import 'package:firebase_core/firebase_core.dart';

//Initialize Firebase
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Map<String, dynamic>> datas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(datas.isEmpty ? 'Empty' : datas.toString()),
            StreamBuilder<DocumentSnapshot>(
              stream: getStream(),
              builder: (
                BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Loading...');
                } else if (!snapshot.hasData) {
                  return const Text('Document does not exist.');
                }
                final data = snapshot.data!.data() as Map<String, dynamic>;
                return Text(data.toString());
              },
            ),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text('Fetch Data'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    final collectionRef = FirebaseFirestore.instance.collection('users');
    final querySnapshot = await collectionRef.get();
    final docs = querySnapshot.docs;

    final updatedDatas = docs.map((doc) => doc.data()).toList();

    setState(() {
      datas = updatedDatas;
    });
  }

  Stream<DocumentSnapshot> getStream() {
    final docRef =
        FirebaseFirestore.instance.collection('users').doc('hogehoge');
    // Return a stream of the document
    return docRef.snapshots();
  }
}
