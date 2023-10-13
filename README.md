# almost_zenly

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

メモ

final StreamSubscription subscription =　 intStream.listen((int value){
if(value %2 == 0){
print('even number');
}else{
print('odd number')
}
});

final StreamSubscription subscription:
この部分で、StreamSubscription 型の変数 subscription を宣言し、intStream.listen の戻り値を代入しています。この変数は後でイベントリスナーを解除するために使用できます。

(int value):
intStream.listen メソッドは、整数のストリームにリスニングするためのリスナーを設定します。この部分では、リスナーの引数として整数の値を受け取り、この値は value という名前の仮引数（変数）に割り当てられます。

リスナー関数本体:
リスナーの本体は、if ステートメントを含むブロックです。このブロック内で条件に応じてテキストを出力しています。ブロック内のテキストはリスナー関数内でのみ有効な変数や宣言は含まれていませんが、value 変数は引数としてリスナー関数に渡されたことを考えると、ここで使われている変数です。

したがって、このコードの中で宣言されている変数は subscription と value の 2 つです。 subscription はストリームのリスニングを管理し、value は整数のストリームから受け取る値を格納します。

LocationSettings クラス
LocationSettings クラスでは、現在地の監視に関して以下三つの設定を行うことが出来ます。

accuracy：通知の精度を指定することが出来ます。詳しくはこちらを参照ください。
distanceFilter：どれくらいの距離を移動したら通知するか指定することが出来ます。
timeLimit:通知を受け取るべき時間の間隔を指定する事が出来ます。ここで指定した時間内に位置情報が更新されなかった場合、エラーを throw します。
