/*
 *  try1.cp
 *  try1
 *
 *  Created by cat on 9/28/15.
 *  Copyright (c) 2015 myxcode. All rights reserved.
 *
 */

#include "try1.h"
#include "try1Priv.h"

CFStringRef try1UUID(void)
{
	Ctry1* theObj = new Ctry1;
	return theObj->UUID();
}

CFStringRef Ctry1::UUID()
{
	return CFSTR("0001020304050607");
}
