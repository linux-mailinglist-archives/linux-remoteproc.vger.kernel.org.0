Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7E18153C7D
	for <lists+linux-remoteproc@lfdr.de>; Thu,  6 Feb 2020 02:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727550AbgBFBQt (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 5 Feb 2020 20:16:49 -0500
Received: from wsip-184-185-158-229.sd.sd.cox.net ([184.185.158.229]:46199
        "EHLO s0-postfix.allcaps.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727170AbgBFBQt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 5 Feb 2020 20:16:49 -0500
Received: from MacBook-Pro.local (unknown [12.197.118.92])
        by s0-postfix.allcaps.org (Postfix) with ESMTPSA id 98E071C64048;
        Wed,  5 Feb 2020 16:06:23 -0800 (PST)
Subject: Re: How to get src and dst for pru_rpmsg_send?
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
References: <f22d9305-326f-f584-4480-9509c5f903fb@allcaps.org>
 <20200205232148.GC25901@xps15>
From:   "Andrew P. Lentvorski" <bsder@allcaps.org>
Autocrypt: addr=bsder@allcaps.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <49d5fcdb-e51e-f289-15fb-eea2efdcf477@allcaps.org>
Date:   Wed, 5 Feb 2020 17:16:47 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200205232148.GC25901@xps15>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi, Mathieu,

On 2/5/20 3:21 PM, Mathieu Poirier wrote:
> Hi Andrew,
> 
> On Wed, Feb 05, 2020 at 02:24:07AM -0800, Andrew P. Lentvorski wrote:
>> I seem to be missing something obvious: Where do I get the values for
>> src and dst in the pru_rpmsg_send() function?
>>
>> The TI examples do a pru_rpmsg_receive() first and then echo back to the
>> same src and dst.  That seems ... odd.  What's the point of having a
>> variable src and dst if they are effectively hardwired to a single
>> communication channel?
> 
> Since pru_rpmsg_send/receive() don't exist in the mainline kernel you will have
> to be more specific... What TI examples are you referring to?  Where can we find
> them? 

TI keeps the examples here:
https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/

This is a good example of the rpmsg system being used with the echo I
talked about:
https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/tree/examples/am335x/PRU_RPMsg_Echo_Interrupt1

That example works on the Beaglebone Black (an am3359 based Linux board).

> There are other rpmsg_sendxyz() functions that allow you to send messages to
> different addresses[1].  Given the amount of information, I'm afraid there isn't
> much else I can add at this time.
> 
> Thanks,
> Mathieu  
> 
> [1]. https://elixir.bootlin.com/linux/latest/source/include/linux/rpmsg.h#L125

Thanks for the pointers.

It looks like I need to drag the src/dst out of the rpmsg_device or
rpmsg_channel_info on the Linux side and then pass it to the PRU side by
some method.  An initial message is as good as any and better than most.

I completely flaked that this wouldn't be in mainline.  Even a simple
thought about the name "*pru*_rpmsg_send" should have set off alarm
bells.  Sorry about that.

Thanks for the help,
-a
