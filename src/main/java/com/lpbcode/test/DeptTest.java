package com.lpbcode.test;

import com.lpbcode.domain.Department;
import com.lpbcode.service.DepartmentService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml","classpath:springmvc.xml"})
public class DeptTest {

    @Autowired
    private DepartmentService departmentService;

    @Test
    public void testDept(){

        List<Department> departments = departmentService.selectAllName();
        for (Department department : departments) {
            System.out.println(department);
        }
    }

}
