package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.coderliu.utils.UploadUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author: liu
 * @date: 2023/12/25
 * @description：
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/upload")
public class UploadController {

    private final UploadUtils utils;


    /**
     * @param file
     * @return
     */
    @PostMapping("/upload")
    public ReturnData<Void> upload(@RequestParam("file") MultipartFile file) {
        utils.upload(file, file.getOriginalFilename());
        return ReturnData.succeed();
    }


}
