Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4091686DE
	for <lists+linux-remoteproc@lfdr.de>; Fri, 21 Feb 2020 19:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729585AbgBUSmk (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 21 Feb 2020 13:42:40 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43439 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgBUSmk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 21 Feb 2020 13:42:40 -0500
Received: by mail-pf1-f193.google.com with SMTP id s1so1669177pfh.10
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Feb 2020 10:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/zFjPXs4Y0NII72nGSRDk19t/a2aSWdxIBmz8i14jj8=;
        b=hCV5wWMM4cj4NHSEYugwASyRMDbDo8/O1XzigZpry9yvw78/0/WW0Zb/+PByjS+dnS
         t39vasXj+xV1yHSE5KV+Xg0cfO2Sh4INtkPkmpucjn6/cXEqrtlimCp6n6sEJ9UD9HQK
         9+RCkL9Bk6a166KPk86lHBeTL5ZnN6W+l3Lt/VmwoKdM/Amn8yACwR6D3ArLlzj+wceT
         8RX1nmyINH2kFfdrrhn3gBMqlirmWfIpji+GYK7I3GEelOiJ/2fb6BMG+Uu/h/5WFl7z
         EMJ60wbsOd5mb5AqH/XDNafeGkYZ9BZP9EMQTkCX3JZvQDa4Yx0MXubWmu/hWJ6pIhLu
         1Vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/zFjPXs4Y0NII72nGSRDk19t/a2aSWdxIBmz8i14jj8=;
        b=O41+52WzZsgoim7F3C6EBt4ugU/FOjyB+/30w5N5Lsd7xLEJ1z8DKEiy3HFI39qsIJ
         GPxmvkrHFBYUqsVJrtcomBW4RnktP1blfpbqsm96fynKYQx0BlMYz5ol00DZPECFipNJ
         Wtv3thrVeCcEUOKbRS6lvqjbAd1oKiHbRhAjvCf1r6140xIaYzTTompgya8ZwC6SGrb8
         2Oq5EeGa8R/Zd/F9S0AxKacxouoEkwhpW0lb+C5ltSYIJSQMQVbMvrKI3GBym9kY7Gdd
         0gZPHdrjp0Snk28xA6kpdffps/I9Eq7RneBLseGthL3kvrGoUn+dlYQHum29t3Chgx5H
         SLNA==
X-Gm-Message-State: APjAAAXVwewN0bSNJ7PJWl0eLHg9NoiyE6Rx9ASiKZe+K4vyn4i5cEh5
        5+wayBXWca6ZVP0Sj5aKeWj/Pw==
X-Google-Smtp-Source: APXvYqwFclKSbXXs14coB+cqHxC3U5IbNr0OkYond0+G3XM8i02Nr2HaYjczAmI5EBskNHRghc+wiQ==
X-Received: by 2002:a63:fe4d:: with SMTP id x13mr38950714pgj.147.1582310559562;
        Fri, 21 Feb 2020 10:42:39 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id x28sm3181371pgc.83.2020.02.21.10.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 10:42:38 -0800 (PST)
Date:   Fri, 21 Feb 2020 11:42:36 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     peng.fan@nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] remoteproc: add support to skip firmware load when
 recovery
Message-ID: <20200221184236.GA10368@xps15>
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
 <1582097265-20170-4-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582097265-20170-4-git-send-email-peng.fan@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Peng,

On Wed, Feb 19, 2020 at 03:27:39PM +0800, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Remote processor such as M4 inside i.MX8QXP is not handled by Linux
> when it is configured to run inside its own hardware partition by
> system control unit(SCU). So even remote processor crash reset, it is
> handled by SCU, not linux. To such case, firmware load should be
> ignored, So introduce skip_fw_load_recovery and platform driver
> should set it if needed.

For now I will not comment on the code - I just need clarifications on the
scenario.

In the specific case you are trying to address here, I understand that when the
M4 crashes, the SCU will recognize that and reload the MCU firmware. Does the
SCU also start the MCU or is that left to the remoteproc subsystem?

Thanks,
Mathieu

> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 19 +++++++++++--------
>  include/linux/remoteproc.h           |  1 +
>  2 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 876b5420a32b..ca310e3582bf 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1678,20 +1678,23 @@ int rproc_trigger_recovery(struct rproc *rproc)
>  	if (ret)
>  		goto unlock_mutex;
>  
> -	/* generate coredump */
> -	rproc_coredump(rproc);
> +	if (!rproc->skip_fw_load_recovery) {
> +		/* generate coredump */
> +		rproc_coredump(rproc);
>  
> -	/* load firmware */
> -	ret = request_firmware(&firmware_p, rproc->firmware, dev);
> -	if (ret < 0) {
> -		dev_err(dev, "request_firmware failed: %d\n", ret);
> -		goto unlock_mutex;
> +		/* load firmware */
> +		ret = request_firmware(&firmware_p, rproc->firmware, dev);
> +		if (ret < 0) {
> +			dev_err(dev, "request_firmware failed: %d\n", ret);
> +			goto unlock_mutex;
> +		}
>  	}
>  
>  	/* boot the remote processor up again */
>  	ret = rproc_start(rproc, firmware_p);
>  
> -	release_firmware(firmware_p);
> +	if (!rproc->skip_fw_load_recovery)
> +		release_firmware(firmware_p);
>  
>  unlock_mutex:
>  	mutex_unlock(&rproc->lock);
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 4fd5bedab4fa..fe6ee253b385 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -514,6 +514,7 @@ struct rproc {
>  	bool has_iommu;
>  	bool auto_boot;
>  	bool skip_fw_load;
> +	bool skip_fw_load_recovery;
>  	struct list_head dump_segments;
>  	int nb_vdev;
>  };
> -- 
> 2.16.4
> 
