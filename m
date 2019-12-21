Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3EA3128B77
	for <lists+linux-remoteproc@lfdr.de>; Sat, 21 Dec 2019 21:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbfLUUUn (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Sat, 21 Dec 2019 15:20:43 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45978 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726842AbfLUUUn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 21 Dec 2019 15:20:43 -0500
Received: by mail-pl1-f193.google.com with SMTP id b22so5549126pls.12
        for <linux-remoteproc@vger.kernel.org>; Sat, 21 Dec 2019 12:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Hlfv7lgkbhZZ3SIc3UgNPE6Boampe7OtyYVE0MQkMSA=;
        b=a5NTEAngDx1EoqJzthzVt4uROhz0Vyn8HAS8ScRGRkah+cuhPoYbuGVHLgoGj/Kxw/
         ER3N84SQvXHcpZaTMmPY9o0SoIGsgVuvGbG2IbqVB+0YsxlwU0rvcHVznDRh8y14Kw5h
         oPDRhUfuGDQG6e4tuEXp5bpInZReAGQ1QQcIMWv+80EpgS1gNQFPVWRmcMnL/L7S+pYF
         JnUTw86bn2OflW+M8U5hmhRKQq7Ghw3w1C5OkSnpITAFkEJABmnuyNU7qHIgXd2o8EGn
         Ux5+sGiWJndyi3NX19arm4VFRiy6+xNNPlqH6oU91vI4Kva5xe/qS9+AAaohc3N2lmys
         yu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Hlfv7lgkbhZZ3SIc3UgNPE6Boampe7OtyYVE0MQkMSA=;
        b=rqF158uwr1MEVcR+Elcev5mrd5DwcLy3UToNy6vee/iwtcC787Nq5CM58kvSaKydu4
         VY4bO31mVnCzJ7oHYhKkrTzOzcj+HDGPmoDnAW8ftBsMLrL3RMjyO82J8fzuw5o7q+q9
         oXEfwlHoEfJE3Ivpun1i7iYqAf0iJULXYnUAQu9mNR5wXIHq9EepXCVnKRBUaYkqEvnZ
         485K0t1ehiRs/UapySI9RW9PQpA2cEyyvYyWNCkKpqqUh9hXfFh0zrVg1cJQJO4Xxxm4
         50bmosOXiOAlREsqTvbPgtgM9L/COfSh7pmWTqcmS7UFKeWugXdhVhUTVL6f3imVb7EK
         8+RQ==
X-Gm-Message-State: APjAAAVSCvhAu4w/trGg0+jAE/B+dYZQI6Xh1LYxxRQQqWeCpq+N7JLL
        Rx5QxLe10ffXrIkYpcRo0JEJww==
X-Google-Smtp-Source: APXvYqyQX0g/TRTJDsUTfUwZCKafU5aMcUF3r0SEXFOfDSiADSPnB2M6SwfytxMAz834jQERA25NCA==
X-Received: by 2002:a17:90a:d682:: with SMTP id x2mr24626885pju.44.1576959642249;
        Sat, 21 Dec 2019 12:20:42 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a13sm17946953pfc.40.2019.12.21.12.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2019 12:20:41 -0800 (PST)
Date:   Sat, 21 Dec 2019 12:20:39 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, od@zcrc.me,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] remoteproc: Add prepare/unprepare callbacks
Message-ID: <20191221202039.GG549437@yoga>
References: <20191210164014.50739-1-paul@crapouillou.net>
 <20191210164014.50739-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191210164014.50739-3-paul@crapouillou.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 10 Dec 08:40 PST 2019, Paul Cercueil wrote:

> The .prepare() callback is called before the firmware is loaded to
> memory. This is useful for instance in the case where some setup is
> required for the memory to be accessible.
> 

Would it make sense to somehow tie this prepare/unprepare to the actual
struct rproc_mem_entry that needs the resource enabled?

Regards,
Bjorn

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v2-v4: No change
> 
>  drivers/remoteproc/remoteproc_core.c | 16 +++++++++++++++-
>  include/linux/remoteproc.h           |  4 ++++
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 0a9fc7fdd1c3..3ea5f675a148 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1299,11 +1299,19 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	struct device *dev = &rproc->dev;
>  	int ret;
>  
> +	if (rproc->ops->prepare) {
> +		ret = rproc->ops->prepare(rproc);
> +		if (ret) {
> +			dev_err(dev, "Failed to prepare rproc: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
>  	/* load the ELF segments to memory */
>  	ret = rproc_load_segments(rproc, fw);
>  	if (ret) {
>  		dev_err(dev, "Failed to load program segments: %d\n", ret);
> -		return ret;
> +		goto unprepare_rproc;
>  	}
>  
>  	/*
> @@ -1354,6 +1362,9 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	rproc_unprepare_subdevices(rproc);
>  reset_table_ptr:
>  	rproc->table_ptr = rproc->cached_table;
> +unprepare_rproc:
> +	if (rproc->ops->unprepare)
> +		rproc->ops->unprepare(rproc);
>  
>  	return ret;
>  }
> @@ -1483,6 +1494,9 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>  
>  	rproc->state = RPROC_OFFLINE;
>  
> +	if (rproc->ops->unprepare)
> +		rproc->ops->unprepare(rproc);
> +
>  	dev_info(dev, "stopped remote processor %s\n", rproc->name);
>  
>  	return 0;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 5f201f0c86c3..a6272d1ba384 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -355,6 +355,8 @@ enum rsc_handling_status {
>  
>  /**
>   * struct rproc_ops - platform-specific device handlers
> + * @prepare:	prepare the device for power up (before the firmware is loaded)
> + * @unprepare:	unprepare the device after it is stopped
>   * @start:	power on the device and boot it
>   * @stop:	power off the device
>   * @kick:	kick a virtqueue (virtqueue id given as a parameter)
> @@ -371,6 +373,8 @@ enum rsc_handling_status {
>   * @get_boot_addr:	get boot address to entry point specified in firmware
>   */
>  struct rproc_ops {
> +	int (*prepare)(struct rproc *rproc);
> +	void (*unprepare)(struct rproc *rproc);
>  	int (*start)(struct rproc *rproc);
>  	int (*stop)(struct rproc *rproc);
>  	void (*kick)(struct rproc *rproc, int vqid);
> -- 
> 2.24.0
> 
