package com.lpbcode.service;

import com.lpbcode.dao.EmployeeMapper;
import com.lpbcode.domain.Employee;
import com.lpbcode.domain.EmployeeExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;


    public List<Employee> getAll(){

        return employeeMapper.selectByExampleWithDept(null);
    }

    public Employee getEmp(Integer id){
        return employeeMapper.selectByPrimaryKey(id);
    }


    public void saveEmp(Employee employee){
        employeeMapper.insertSelective(employee);
    }

    public boolean checkUser(String empName){
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long l = employeeMapper.countByExample(example);
        return l==0;
    }

    public void updateEmpp(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }
}
