import '../../../../app/init/imports.dart';

class BarsName extends StatelessWidget {
  const BarsName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            SizedBox(
              width: 10,
              height: 10,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Text(
              'Sent',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              width: 10,
              height: 10,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Text(
              'Received',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
