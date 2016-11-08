/**
	 * ������ת�Ƶ����
	 * 
	 * @param firstName ��һ����
	 * @param secondName �ڶ�������
	 * @param clazzName ����
	 */
	private static void transferData(String firstName, String secondName, Class clazzName) {
		Field[] fields = clazzName.getDeclaredFields();
		for (Field field : fields) {
			String fieldText = field.getName().substring(0, 1).toUpperCase() + field.getName().substring(1);
			System.out.println(firstName + ".set" + fieldText + "(" + secondName + ".get" + fieldText + "());");
		}
	}