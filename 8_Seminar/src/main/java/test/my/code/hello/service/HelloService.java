package test.my.code.hello.service;

import org.springframework.stereotype.Service;

@Service
public class HelloService implements IHelloService {

	@Override
	public String sayHello(String name) {
		// TODO Auto-generated method stub

		System.out.println("\n>>>>>>>>sayHello Method<<<<<<<<<");
		String msg = "Hello User - " + name;

		return msg;
	}

	@Override
	public String sayGoodbye(String name) {
		// TODO Auto-generated method stub

		System.out.println("\n>>>>>>>>>>>sayGoodbye Method<<<<<<<<<<");
		String msg = "Goodbye User - " + name;

		return msg;
	}

}
