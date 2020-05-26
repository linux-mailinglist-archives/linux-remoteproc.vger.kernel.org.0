Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BAEF1A7AC3
	for <lists+linux-remoteproc@lfdr.de>; Tue, 14 Apr 2020 14:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2501943AbgDNM1p (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 14 Apr 2020 08:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2501927AbgDNM1i (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Apr 2020 08:27:38 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C0CFC061A0C
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2020 05:27:38 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id y17so12939785iow.9
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2020 05:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Xn8/ZRFExSMKU2UJG3B6HUEv5uOUwoceNajhHRuX6V0=;
        b=L8rBoWwiY/GOC81qGixrT5zatrTvrh+T0u2I/lyH02NoT6c5clc8grzAYBiIUZ1Toc
         HUZ2sL7IK7OFmqIPG2nCDan618rLX1ERrpB0179fm/1uoX+XpZm5VdPnkJenUo9YubHm
         hogsN7DydnqEAXT9SAEmHVJ+jNfuQUPbn5Y5VutJVmd4RgY+iwt6QZJYRA6t0yt7ZhQj
         EYkn+r/q1J3RWoTJ37KdklxA2G2dWYGZnY3G7wWjdaLzw/M5/9OQO6Zwr/sMuhPPHRLB
         neanrnVNGNoEIG34PFeVmiq0s9SxP0hBDXVo2eUvvGOzRnL/C3ttJggh4psN7YIHNQDO
         LVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Xn8/ZRFExSMKU2UJG3B6HUEv5uOUwoceNajhHRuX6V0=;
        b=FgYeYCb+83VfceNShCKR/DOdWEyKjLBu/5p6QV5wD7ooH6JnE825uu9qCzomXN89Ne
         liy4YlbrIyqI/0ON9A9yFUc9xX306R+rhyXgtxKCVDNlXR/uHmgtILOSXLYjVCI/BBKO
         Ec1FQDCObhO4Q1HKLu12jzDRSy6FNPQ/Yui+cnMTZ9kM7uOhapF4nJvvmEyVTsEAB3WR
         Xg1ghhYrqVho88NGse2Hnu9VNCFHc8tDsG1ok9d2BjIexzU4vDReZ5qBg+piQnha0YK+
         FHTB7gE2txbMzJ/yzV96QhHUh438tBidX/5QE4rpLtwZC/2GgayZws63pmJ6vsKLh9BW
         UlYw==
X-Gm-Message-State: AGi0PuZ1H3uEEnBT39WJLITopD/6RsNJVgqd94EesK6mstiQuEO0EC+l
        5C4I73imy6UtSqU8FeIkv9+uZ11I9o6S1Q==
X-Google-Smtp-Source: APiQypJPkNYzInmS2MYdSfh5zb7ZMT1+nhzriatmUZIlwuRMjkmgVtkGbSJHY7hD/WGF+tS+04xaYA==
X-Received: by 2002:a6b:fc0d:: with SMTP id r13mr20547117ioh.89.1586867257797;
        Tue, 14 Apr 2020 05:27:37 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id r10sm4346744iom.42.2020.04.14.05.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 05:27:37 -0700 (PDT)
Subject: Re: [PATCH 4/4] remoteproc: Get rid of tedious error path
To:     Markus Elfring <Markus.Elfring@web.de>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>, Suman Anna <s-anna@ti.com>
References: <e5e03d6b-46bd-5ece-a7f6-3cb557c3b0b0@web.de>
From:   Alex Elder <elder@linaro.org>
Message-ID: <3c2ea363-e60f-b3ef-e66f-df8d558972bf@linaro.org>
Date:   Tue, 14 Apr 2020 07:27:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e5e03d6b-46bd-5ece-a7f6-3cb557c3b0b0@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 4/14/20 3:53 AM, Markus Elfring wrote:
> …
>> +++ b/drivers/remoteproc/remoteproc_core.c
> …
>> @@ -2105,11 +2104,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> …
>> +out:
>> +	put_device(&rproc->dev);
> 
> How do you think about to use the label “put_device”?

+1

> 
> Regards,
> Markus
> 

