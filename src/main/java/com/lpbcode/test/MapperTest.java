package com.lpbcode.test;

import com.lpbcode.dao.DepartmentMapper;
import com.lpbcode.dao.EmployeeMapper;
import com.lpbcode.domain.Department;
import com.lpbcode.domain.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml","classpath:springmvc.xml"})
public class MapperTest {

    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private SqlSession sqlSession;

    @Test
    public void testCRUD(){
        System.out.println(departmentMapper);

        //departmentMapper.insertSelective(new Department(null,"开发部"));
       // departmentMapper.insertSelective(new Department(null,"测试部"));
        //employeeMapper.insertSelective(new Employee(null,"Jerry","M","Jerry@qq.com",1));
//        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//        for (int i = 0; i < 1000; i++) {
//            String uid = UUID.randomUUID().toString().substring(0, 5) + " "+i ;
//            mapper.insertSelective(new Employee(null,uid,"M",uid+"@qq.com",1));
//        }

    }

}
