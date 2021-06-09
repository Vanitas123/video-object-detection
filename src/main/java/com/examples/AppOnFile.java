package com.examples;

import ai.djl.ModelException;
import ai.djl.util.Utils;
import com.amazonaws.kinesisvideo.parser.ebml.InputStreamParserByteSource;
import com.amazonaws.kinesisvideo.parser.mkv.MkvElementVisitException;
import com.amazonaws.kinesisvideo.parser.mkv.StreamingMkvReader;
import com.amazonaws.kinesisvideo.parser.utilities.FrameVisitor;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class AppOnFile {

    private static final String FILENAME = "D:\\Vanita\\DataScienceWorkspace\\djl-demo-master\\aws\\aws-kinesis-video-streams\\src_test_resources_bezos_vogels.mkv";

    public static void main(String[] args)
            throws IOException, ModelException, MkvElementVisitException {
        try (InputStream is = Files.newInputStream(Paths.get(FILENAME))) {
            InputStreamParserByteSource ipbs = new InputStreamParserByteSource(is);
            StreamingMkvReader reader = StreamingMkvReader.createDefault(ipbs);

            Path outDir = Paths.get("D:\\\\Vanita\\\\DataScienceWorkspace\\\\djl-demo-master\\\\aws\\\\aws-kinesis-video-streams\\build\\out");
            Utils.deleteQuietly(outDir);
            Files.createDirectories(outDir);

            FrameVisitor frameVisitor = FrameVisitor.create(new DjlImageVisitor());

            reader.apply(frameVisitor);
            System.out.println("Done");
        }
    }
}
