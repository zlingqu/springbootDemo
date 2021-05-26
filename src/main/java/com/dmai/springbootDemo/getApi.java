package com.dmai.springbootDemo;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class getApi {
    @Value("${myEnv.name}")
    private String name;
    @GetMapping("")
    public String index(){
        return "Hello, I am index !,我运行在-----"+name+"-----环境";
    }
}
