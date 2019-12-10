package test.code.study.service.proxy;

import org.springframework.stereotype.Component;

import test.code.study.service.HelloService;
import test.code.study.util.HelloLog;

@Component("helloServiceProxy")
public class HelloServiceProxy extends HelloService {

	@Override
	public String sayHello(String name) {
		// TODO Auto-generated method stub
		HelloLog.log();
		return super.sayHello(name);
	}

	@Override
	public String sayGoodbye(String name) {
		// TODO Auto-generated method stub
		HelloLog.log();
		return super.sayGoodbye(name);
	}

}
