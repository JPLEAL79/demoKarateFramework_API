package api;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class TestApi {


    @Test
    void testParallel() {
        Results results = Runner.path("classpath:api").tags("@critico")
                .outputCucumberJson(true)
                .parallel(5);
        generateCucumberReport();
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    private void generateCucumberReport(){
        File reportDir = new File("C:\\Users\\jplea\\repoJP\\karateFramework_API\\target\\karate-reports");
        Collection<File> jsonCollection = FileUtils.listFiles(reportDir, new String[]{"json"}, true);

        List<String> jsonFiles = new ArrayList<>();
        jsonCollection.forEach(file -> jsonFiles.add(file.getAbsolutePath()));

        Configuration configuration = new Configuration(reportDir, "reporte de ejecución");
        ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
        reportBuilder.generateReports();
    }
}


