package test.code.study.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LogAspect {

	@Pointcut(value = "execution(* test.code..*.sayHello(..))")
	public void helloPointcut() {

	}

	@Pointcut(value = "execution(* test.code..*.sayGoodbye(..))")
	public void goodbyePointcut() {

	}

	@Before("helloPointcut()")
	public void beforeLog(JoinPoint joinPoint) {
		Signature signature = joinPoint.getSignature();
		System.out.println("[Log: Before] method : " + signature.getName());
	}
	
	@After("helloPointcut()")
	public void afterLog(JoinPoint joinPoint) {
		Signature signature = joinPoint.getSignature();
		System.out.println("[Log: After] method : " + signature.getName());
	}

	@AfterReturning("helloPointcut()")
	public void afterReturingLog(JoinPoint joinPoint) {
		Signature signature = joinPoint.getSignature();
		System.out.println("[Log: AfterReturning] method : " + signature.getName());
	}

	@AfterThrowing("helloPointcut()")
	public void afterThrowingLog(JoinPoint joinPoint) {
		Signature signature = joinPoint.getSignature();
		System.out.println("[Log: AfterThrowing] method : " + signature.getName());
	}

	
	@Around("execution(* test.code..*.*(..))")
	public Object trace(ProceedingJoinPoint joinPoint) throws Throwable {

		Signature s = joinPoint.getSignature();
		String methodName = s.getName();
		System.out.println("[Log]Before: " + methodName + " time check start");

		long startTime = System.nanoTime();

		Object result = null;
		try {
			result = joinPoint.proceed();
		} catch (Exception e) {
			System.out.println("[Log]Exception: " + methodName);
		} finally {
			System.out.println("[Log]Finally: " + methodName);
		}

		long endTime = System.nanoTime();
		System.out.println("[Log]After: " + methodName + " time check end");
		System.out.println("[Log]" + methodName + " Processing time is " + (endTime - startTime) + "ns");
		return result;
	}


}
