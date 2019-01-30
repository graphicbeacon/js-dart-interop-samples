import 'package:js/js_util.dart';
import '../interop/react.dart';

var HelloMessage = createReactClass(
  render: (ReactClassInterface self) => React.createElement(
        'h1',
        null,
        ['Hello, ${getProperty(self.props, 'name')}'],
      ),
);
