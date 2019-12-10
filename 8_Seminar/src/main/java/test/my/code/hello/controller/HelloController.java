package test.my.code.hello.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import test.my.code.hello.service.IHelloService;

@Controller
public class HelloController {

	@Autowired
	@Qualifier("helloService")
	IHelloService helloService;

	public void hello(String name) throws InterruptedException {
		System.out.println("@HelloController : " + helloService.sayHello(name) + "\n");

		Thread.sleep(500);

		System.out.print("Using");
		for (int i = 0; i < 5; i++) {
			Thread.sleep(1000);
			System.out.print(".");
		}

		Thread.sleep(500);

		System.out.println();

		System.out.println("@HelloController : " + helloService.sayGoodbye(name) + "\n");

	}

}
