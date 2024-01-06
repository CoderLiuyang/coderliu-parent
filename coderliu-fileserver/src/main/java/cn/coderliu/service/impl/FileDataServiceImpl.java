package cn.coderliu.service.impl;

import cn.coderliu.mapper.FileDataMapper;
import cn.coderliu.model.FileData;
import cn.coderliu.service.FileDataService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class FileDataServiceImpl extends ServiceImpl<FileDataMapper, FileData> implements FileDataService {
}
