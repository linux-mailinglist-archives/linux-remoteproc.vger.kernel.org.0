Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCE3B1AE1F9
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Apr 2020 18:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729918AbgDQQP6 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 17 Apr 2020 12:15:58 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41360 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728105AbgDQQP6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Apr 2020 12:15:58 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03HGFuc9054021;
        Fri, 17 Apr 2020 11:15:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587140156;
        bh=8XNtELKWzpnij+R4SB5BXR2hr1jNZvpQH8VXFu0sUks=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=GZ8kjuE85b2VfZ524qNbAeY4S3NlC6ub4zEj9qCT0khHFg+wOtwLXGfJhOe58r+Ul
         Ob0zeSUOyRoRitpjiznPs8XzahJjjUgFMd8jxA6OEh+zhipR853asTCRT9VcYMZGPB
         1rbUxnRc7Cd0YBaHzGOUngJR5nIBL+Afl9uURDvg=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03HGFuVF127396;
        Fri, 17 Apr 2020 11:15:56 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 17
 Apr 2020 11:15:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 17 Apr 2020 11:15:56 -0500
Received: from [10.250.48.148] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03HGFtos124883;
        Fri, 17 Apr 2020 11:15:55 -0500
Subject: Re: [v2 5/7] remoteproc: Restructure firmware name allocation
To:     Markus Elfring <Markus.Elfring@web.de>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, Alex Elder <elder@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-6-mathieu.poirier@linaro.org>
 <aa565fea-b1c4-9b5c-73ed-591244afee19@web.de>
 <e887c990-8cba-62b0-0f47-3ea0c166d603@ti.com>
 <7a978c24-945d-8d39-3a0a-30e0678d569a@web.de>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <9d3e4511-27f4-3523-a90c-2ff64d1d9c89@ti.com>
Date:   Fri, 17 Apr 2020 11:15:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7a978c24-945d-8d39-3a0a-30e0678d569a@web.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 4/17/20 10:48 AM, Markus Elfring wrote:
>>>      p = firmware ? kstrdup_const(…) : kasprintf(…);
>>
>> For simple assignments, I too prefer the ternary operator,
> 
> Thanks for your feedback.
> 
> 
>> but in this case, I think it is better to leave the current code as is.
> 
> Would you like to consider the use of the function “kvasprintf_const”
> according to your review comment for the update step “[PATCH v2 4/7] remoteproc:
> Use kstrdup_const() rather than kstrup()”?

This patch is just swapping the condition order, so will automatically 
be adjusted for any changes in patch 4 during the rebase.

regards
Suman
