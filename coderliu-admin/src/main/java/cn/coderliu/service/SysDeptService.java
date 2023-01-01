package cn.coderliu.service;

import cn.coderliu.model.SysDept;
import cn.hutool.core.lang.tree.Tree;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface SysDeptService extends IService<SysDept> {
    List<Tree<String>> listDeptTrees();

    List<Tree<String>> listCurrentUserDeptTrees();
}
