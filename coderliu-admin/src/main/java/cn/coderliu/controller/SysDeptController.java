package cn.coderliu.controller;

import cn.coderliu.common.ReturnData;
import cn.coderliu.model.SysDept;
import cn.coderliu.service.SysDeptService;
import cn.hutool.core.lang.tree.Tree;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 部门的控制类
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/dept")
public class SysDeptController {


  private final SysDeptService sysDeptService;

  /**
   * 通过ID查询
   * @param id ID
   * @return SysDept
   */
  @GetMapping("/{id:\\d+}")
  public ReturnData<SysDept> getById(@PathVariable String id) {
    return ReturnData.succeed(sysDeptService.getById(id));
  }
    /**
     * 返回树形菜单集合
     *
     * @return 树形菜单
     */
    @GetMapping(value = "/tree")
    public ReturnData<List<Tree<String>>> listDeptTrees() {
     return ReturnData.succeed(sysDeptService.listDeptTrees());
    }



  /**
   * 返回当前用户树形菜单集合
   * @return 树形菜单
   */
  @GetMapping(value = "/user-tree")
  public ReturnData<List<Tree<String>>> listCurrentUserDeptTrees() {
    return ReturnData.succeed(sysDeptService.listCurrentUserDeptTrees());
  }

//  /**
//   * 添加
//   * @param sysDept 实体
//   * @return success/false
//   */
//  @PostMapping
//  @PreAuthorize("@pms.hasPermission('sys_dept_add')")
//  public ReturnData<Boolean> save(@Valid @RequestBody SysDept sysDept) {
//    return ReturnData.succeed(sysDeptService.saveDept(sysDept));
//  }
//
//  /**
//   * 删除
//   * @param id ID
//   * @return success/false
//   */
//  @SysLog("删除部门")
//  @DeleteMapping("/{id:\\d+}")
//  @PreAuthorize("@pms.hasPermission('sys_dept_del')")
//  public R<Boolean> removeById(@PathVariable Long id) {
//    return R.ok(sysDeptService.removeDeptById(id));
//  }
//
//  /**
//   * 编辑
//   * @param sysDept 实体
//   * @return success/false
//   */
//  @SysLog("编辑部门")
//  @PutMapping
//  @PreAuthorize("@pms.hasPermission('sys_dept_edit')")
//  public R<Boolean> update(@Valid @RequestBody SysDept sysDept) {
//    return R.ok(sysDeptService.updateDeptById(sysDept));
//  }
//
//  /**
//   * 根据部门名查询部门信息
//   * @param deptname 部门名
//   * @return
//   */
//  @GetMapping("/details/{deptname}")
//  public R<SysDept> user(@PathVariable String deptname) {
//    SysDept condition = new SysDept();
//    condition.setName(deptname);
//    return R.ok(sysDeptService.getOne(new QueryWrapper<>(condition)));
//  }
//
//  /**
//   * 查收子级id列表
//   * @return 返回子级id列表
//   */
//  @Inner
//  @GetMapping(value = "/child-id/{deptId:\\d+}")
//  public R<List<Long>> listChildDeptId(@PathVariable Long deptId) {
//    return R.ok(sysDeptService.listChildDeptId(deptId));
//  }
}
