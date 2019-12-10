package test.code.study;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import test.code.study.controller.HelloController;

public class HelloMain {

	public static void main(String[] args) throws InterruptedException {
		// TODO Auto-generated method stub
		AbstractApplicationContext context = new GenericXmlApplicationContext("application-config.xml");
		HelloController controller = context.getBean("helloController", HelloController.class);
		controller.method("TestUser" + ((int) (Math.random() * (10000 - 1000 + 1)) + 1000));
		context.close();

	}

}
