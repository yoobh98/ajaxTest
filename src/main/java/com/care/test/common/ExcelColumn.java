package com.care.test.common;

import java.lang.annotation.*;

@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface ExcelColumn {
	String headerName() default "";
	int headerNum() default 0;
}
