# aria2_rpc

An aria2 api package developed with dart which can be used in a flutter project, support http and websocket connection to an aria2 jsonrpc server.

## Features

1. Connect to an aria2 jsonrpc server, control the aria2 downloader remotely.
2. Support http, websocket.
3. Support secret authentication

## Usage

You can use this package like this:

```dart
import 'package:aria2_rpc/aria2_rpc.dart';

void main() async {
    try{
        // protocol can be "http" or "websocket"
        final client = Aria2HttpClient(
            host: host,
            port: port,
            path: path,
            func: Aria2HttpFunction.post,
        );

        final version = await client.getVersion();
        print(version.toString());
        // return {"id":"xxx","jsonrpc":"2.0","result":{"enabledFeatures":["Async DNS","BitTorrent","Firefox3 Cookie","GZip","HTTPS","Message Digest","Metalink","XML-RPC","SFTP"],"version":"1.36.0"}}

        final globalStatus = await client.getGlobalStat();
        print(globalStatus.toString());
        //return {"id":"xxx","jsonrpc":"2.0","result":{"downloadSpeed":"0","numActive":"0","numStopped":"34","numStoppedTotal":"36","numWaiting":"0","uploadSpeed":"0"}}
    } catch (e) {
        print(e);
    }
}
```

More aria2 usage can be found at [aria2c API](https://aria2.github.io/manual/en/html/aria2c.html#methods)

## Additional information

If you have any usage problem, please tell me in the Issues.
