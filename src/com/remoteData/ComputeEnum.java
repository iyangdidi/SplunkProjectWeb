package com.remoteData;

public enum ComputeEnum {
	COMPUTE_ALL(2,"ALL"),
	COMPUTE_ERROR(0,"ERROR"),
	COMPUTE_INFO(1,"INFO");
	
	private int value;
	private String name;
	
	public static String getFlagsName(int flagsId) {
        for (ComputeEnum t : ComputeEnum.values()) {
            if (t.getValue() == flagsId) {
                return t.getName();
            }
        }
        return null;
    }
	
	private ComputeEnum(int value, String name) {
		this.value = value;
		this.name = name;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}