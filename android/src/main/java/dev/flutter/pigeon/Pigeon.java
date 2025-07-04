// Autogenerated from Pigeon (v25.3.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package dev.flutter.pigeon;

import android.util.Log;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/** Generated class from Pigeon. */
@SuppressWarnings({"unused", "unchecked", "CodeBlock2Expr", "RedundantSuppression", "serial"})
public class Pigeon {

  /** Error class for passing custom error details to Flutter via a thrown PlatformException. */
  public static class FlutterError extends RuntimeException {

    /** The error code. */
    public final String code;

    /** The error details. Must be a datatype supported by the api codec. */
    public final Object details;

    public FlutterError(@NonNull String code, @Nullable String message, @Nullable Object details) 
    {
      super(message);
      this.code = code;
      this.details = details;
    }
  }

  @NonNull
  protected static ArrayList<Object> wrapError(@NonNull Throwable exception) {
    ArrayList<Object> errorList = new ArrayList<>(3);
    if (exception instanceof FlutterError) {
      FlutterError error = (FlutterError) exception;
      errorList.add(error.code);
      errorList.add(error.getMessage());
      errorList.add(error.details);
    } else {
      errorList.add(exception.toString());
      errorList.add(exception.getClass().getSimpleName());
      errorList.add(
        "Cause: " + exception.getCause() + ", Stacktrace: " + Log.getStackTraceString(exception));
    }
    return errorList;
  }

  private static class PigeonCodec extends StandardMessageCodec {
    public static final PigeonCodec INSTANCE = new PigeonCodec();

    private PigeonCodec() {}

    @Override
    protected Object readValueOfType(byte type, @NonNull ByteBuffer buffer) {
      switch (type) {
        default:
          return super.readValueOfType(type, buffer);
      }
    }

    @Override
    protected void writeValue(@NonNull ByteArrayOutputStream stream, Object value) {
      {
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter. */
  public interface Md5FileChecksumApi {

    @NonNull 
    String getFileChecksum(@NonNull String filePath);

    /** The codec used by Md5FileChecksumApi. */
    static @NonNull MessageCodec<Object> getCodec() {
      return PigeonCodec.INSTANCE;
    }
    /**Sets up an instance of `Md5FileChecksumApi` to handle messages through the `binaryMessenger`. */
    static void setUp(@NonNull BinaryMessenger binaryMessenger, @Nullable Md5FileChecksumApi api) {
      setUp(binaryMessenger, "", api);
    }
    static void setUp(@NonNull BinaryMessenger binaryMessenger, @NonNull String messageChannelSuffix, @Nullable Md5FileChecksumApi api) {
      messageChannelSuffix = messageChannelSuffix.isEmpty() ? "" : "." + messageChannelSuffix;
      BinaryMessenger.TaskQueue taskQueue = binaryMessenger.makeBackgroundTaskQueue();
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(
                binaryMessenger, "dev.flutter.pigeon.md5_file_checksum.Md5FileChecksumApi.getFileChecksum" + messageChannelSuffix, getCodec(), taskQueue);
        if (api != null) {
          channel.setMessageHandler(
              (message, reply) -> {
                ArrayList<Object> wrapped = new ArrayList<>();
                ArrayList<Object> args = (ArrayList<Object>) message;
                String filePathArg = (String) args.get(0);
                try {
                  String output = api.getFileChecksum(filePathArg);
                  wrapped.add(0, output);
                }
 catch (Throwable exception) {
                  wrapped = wrapError(exception);
                }
                reply.reply(wrapped);
              });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
}
