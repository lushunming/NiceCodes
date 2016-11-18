/**
	 * 将数据转移的语句
	 * 
	 * @param firstName 第一名称
	 * @param secondName 第二个名称
	 * @param clazzName 雷名
	 */
	private static void transferData(String firstName, String secondName, Class clazzName) {
		Field[] fields = clazzName.getDeclaredFields();
		int a = 0;
		for (Field field : fields) {
			String fieldText = field.getName().substring(0, 1).toUpperCase() + field.getName().substring(1);
			if (field.getType().equals(Integer.class)) {
				System.out.println("if(null==" + firstName + ".get" + fieldText + "()" + "){");
				System.out.println(firstName + ".set" + fieldText + "(0);");
				System.out.println("}");
			}
			if (field.getType().equals(Double.class)) {
				System.out.println("if(null==" + firstName + ".get" + fieldText + "()" + "){");
				System.out.println(firstName + ".set" + fieldText + "(0d);");
				System.out.println("}");
			}
			System.out.println(firstName + ".set" + fieldText + "(" + secondName + ".get" + fieldText + "());");
			a++;
		}
		System.out.println("a=" + a);
	}
