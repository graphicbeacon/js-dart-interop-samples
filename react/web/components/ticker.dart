import 'dart:async';

import 'package:react/react.dart';

class TickerComponent extends Component {
  Timer interval;

  tick() {
    setState({
      'seconds': state['seconds'] + 1,
    });
  }

  @override
  Map getInitialState() => {'seconds': 0};

  @override
  componentDidMount() {
    interval = Timer.periodic(Duration(seconds: 1), (_) => tick());
  }

  @override
  componentWillUnmount() {
    interval.cancel();
  }

  @override
  render() => div({}, 'Seconds ${state["seconds"]}');
}

var Ticker = registerComponent(() => TickerComponent());
