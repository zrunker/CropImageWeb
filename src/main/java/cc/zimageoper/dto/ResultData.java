package cc.zimageoper.dto;

/**
 * 封装JSON结果
 * 
 * @author 邹峰立
 * 
 * @param <T>
 */
public class ResultData<T> {
	private int resultCode; // 状态码
	private String resultMsg; // 状态说明
	private T data; // 值

	public ResultData() {
		super();
	}

	public ResultData(int resultCode, String resultMsg, T data) {
		super();
		this.resultCode = resultCode;
		this.resultMsg = resultMsg;
		this.data = data;
	}

	public int getResultCode() {
		return resultCode;
	}

	public void setResultCode(int resultCode) {
		this.resultCode = resultCode;
	}

	public String getResultMsg() {
		return resultMsg;
	}

	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "MobileResult [resultCode=" + resultCode + ", resultMsg="
				+ resultMsg + ", data=" + data + "]";
	}

}
