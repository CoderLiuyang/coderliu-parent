package cn.coderliu.service.impl;

import cn.coderliu.constants.CommonConstants;
import cn.coderliu.mapper.SysDeptMapper;
import cn.coderliu.model.SysDept;
import cn.coderliu.service.SysDeptService;
import cn.coderliu.utils.SecurityUtils;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNode;
import cn.hutool.core.lang.tree.TreeUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class SysDeptServiceImpl extends ServiceImpl<SysDeptMapper, SysDept> implements SysDeptService {

    /**
     * 查询全部部门树
     *
     * @return 树
     */
    @Override
    public List<Tree<String>> listDeptTrees() {
        return getDeptTree(this.list(Wrappers.emptyWrapper()), CommonConstants.MENU_TREE_ROOT_ID);
    }

    @Override
    public List<Tree<String>> listCurrentUserDeptTrees() {
        String deptId = Objects.requireNonNull(SecurityUtils.getUser()).getDeptId();
        final var deptList = baseMapper.selectList(new LambdaQueryWrapper<SysDept>().eq(SysDept::getPId, deptId));
        Optional<SysDept> dept = deptList.stream().filter(item -> item.getId().equals(deptId)).findFirst();
        return getDeptTree(deptList, dept.isPresent() ? dept.get().getPId() : CommonConstants.MENU_TREE_ROOT_ID);
    }

    @Override
    public Boolean saveDept(SysDept sysDept) {
        return save(sysDept);
    }

    @Override
    public Boolean removeDeptById(String id) {
        remove(new LambdaQueryWrapper<SysDept>().eq(SysDept::getPId, id));
        removeById(id);
        return Boolean.TRUE;
    }


    /**
     * 构建部门树
     *
     * @param depts    部门
     * @param parentId 父级id
     * @return
     */
    private List<Tree<String>> getDeptTree(List<SysDept> depts, String parentId) {
        List<TreeNode<String>> collect = depts.stream().filter(dept -> !dept.getId().equals(dept.getPId()))
                .sorted(Comparator.comparingInt(SysDept::getOrderNum)).map(dept -> {
                    TreeNode<String> treeNode = new TreeNode<>();
                    treeNode.setId(dept.getId());
                    treeNode.setParentId(dept.getPId());
                    treeNode.setName(dept.getDeptName());
                    treeNode.setWeight(dept.getOrderNum());
                    // 扩展属性
                    Map<String, Object> extra = new HashMap<>(4);
                    extra.put("createTime", dept.getCreateTime());
                    treeNode.setExtra(extra);
                    return treeNode;
                }).collect(Collectors.toList());
        return TreeUtil.build(collect, parentId);
    }
}
