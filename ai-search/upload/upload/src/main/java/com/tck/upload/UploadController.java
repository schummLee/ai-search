package com.tck.upload;

import cn.hutool.core.io.FileUtil;
import cn.hutool.json.JSONUtil;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.nio.charset.Charset;
import java.util.HashMap;

@RestController
@RequestMapping("/upload")
public class UploadController {

    @GetMapping("/send")
    public Object send(@RequestParam("songsPlayed") String aa, @RequestParam("mostPlayed") String bb) {
        String path = System.getProperty("user.dir") + "/static";
        File file = new File(path);
        if (!file.exists()) {
            file.mkdirs();
        }
        File jsonFile = new File(path, System.currentTimeMillis() + ".json");

        HashMap<String, String> stringStringHashMap = new HashMap<>();
        stringStringHashMap.put("aa", aa);
        stringStringHashMap.put("bb", bb);

        String jsonStr = JSONUtil.toJsonPrettyStr(stringStringHashMap);
        FileUtil.writeString(jsonStr, jsonFile, Charset.defaultCharset());

        return stringStringHashMap;
    }
}
