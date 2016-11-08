/**
	 * 将数据转移的语句
	 * 
	 * @param firstName 第一名称
	 * @param secondName 第二个名称
	 * @param clazzName 雷名
	 */
	private static void transferData(String firstName, String secondName, Class clazzName) {
		Field[] fields = clazzName.getDeclaredFields();
		for (Field field : fields) {
			String fieldText = field.getName().substring(0, 1).toUpperCase() + field.getName().substring(1);
			System.out.println(firstName + ".set" + fieldText + "(" + secondName + ".get" + fieldText + "());");
		}
	}