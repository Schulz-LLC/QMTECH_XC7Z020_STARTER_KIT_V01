#include "xgpiops.h"
#include "sleep.h"
int main()
{
	static XGpioPs psGpioInstancePtr;
	XGpioPs_Config* GpioConfigPtr;
	int iPinNumber= 10;
	u32 uPinDirection = 0x1;
	int xStatus;

    GpioConfigPtr = XGpioPs_LookupConfig(XPAR_PS7_GPIO_0_DEVICE_ID);
	if(GpioConfigPtr == NULL)
		return XST_FAILURE;

	xStatus = XGpioPs_CfgInitialize(&psGpioInstancePtr,GpioConfigPtr, GpioConfigPtr->BaseAddr);
	if(XST_SUCCESS != xStatus)
		print(" PS GPIO INIT FAILED \n\r");

     XGpioPs_SetDirectionPin(&psGpioInstancePtr, iPinNumber,uPinDirection);
	 XGpioPs_SetOutputEnablePin(&psGpioInstancePtr, iPinNumber,1);

	while(1)
	{
		XGpioPs_WriteReg(0xE000A000, 0x00000000, 0xFBFFFFFF&0xFFFF0400);
		usleep(500000);
		XGpioPs_WriteReg(0xE000A000, 0x00000000, 0xFBFFFFFF&0xFFFF0000);
		usleep(500000);
	}
    return 0;
}
