package test;

import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.qingtao.pojo.File;
import com.qingtao.service.FileService;
import com.qingtao.serviceI.FileServiceI;
import com.qingtao.serviceI.PaperServiceI;
import com.qingtao.serviceI.RolesServiceI;

@SuppressWarnings("all")
public class Unit {

	private ApplicationContext act;

	@Before
	public void getContext() {
		act = new ClassPathXmlApplicationContext("classpath:config/spring-mvc.xml",
				"classpath:config/spring-mybatis.xml");
	}
	
	@Test
	public void name() {
		FileServiceI fs = act.getBean(FileServiceI.class);
		Map<String, Object> map = new HashMap<>();
		map.put("condition", "filename");
		map.put("version", 0);
		map.put("value", "测试文件");
		System.out.println(fs.readForSearch(map));
	}
}

