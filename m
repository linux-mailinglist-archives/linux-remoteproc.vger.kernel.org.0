Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9D21DD96D
	for <lists+linux-remoteproc@lfdr.de>; Thu, 21 May 2020 23:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730519AbgEUV0g (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 21 May 2020 17:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730509AbgEUV0f (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 21 May 2020 17:26:35 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA7DC05BD43
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2020 14:26:35 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id e11so3128451pfn.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2020 14:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sNxVZlCt5dJC4vJhuBkpvXmZzzYVLjMtc81k2G0ucts=;
        b=wKnrlt7dZ0AvB56IYc2LjlLTzqfrJ3PwmXb1LvRDCIsfjvh03rt6qqW6RaYbHnJhKR
         1bXsI1Rql2xrHyEDMaNgHFYXuEgH+gC/4y1zIosCnCeCgZSI0Z5DeGrDUGVOkYeywBSV
         3pg3C1mN/shwWUHjN2AD5CiISjt8M+UWNKreTgvpJFQWjToBzYx35mieruyGZov7XKj2
         9zZD3+PkVzEbY2zkH4Atnmj7OC0lfG3UsLhoL+oBjhTdj7tXLYR7aQ8tPanxeHewD//2
         l1nbPvshBG74JJ1/5S7b3/Ok5IS2D/H+kg0AqQHGt83z1xU9otG27difHMnPRib0yfO3
         5m8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sNxVZlCt5dJC4vJhuBkpvXmZzzYVLjMtc81k2G0ucts=;
        b=lseiyb+rpuyALgaWgAYGw4YG7/hIeRSRhei4yDFEqBmnFcAc8hveHR6E8EPgX/cPn1
         NhGvve26hHO9rS+c1vuViqFYRYZzK7jpqRjCYp4fxqyqtKE3psgiN6TJqXsRHaMrsNhU
         YEiHyt06qvNAEgRwDQdkeSFy0Kw/IBMbQagg0GoxsrSoJBMbOMwPekIiOXoizkST4DvV
         rwzI/bu1D2KtdwAj+qTWOYUhVyTH5gxizSj5v35L0IInWvRdHBovktNW0qf6l9W35e+G
         WQqaQLHH9LOXFl6JnSbMJyrxC18FuAZjpL/MmF4nRLvpEC6y66C1eWcRP4tI8BtQOw1j
         2L2Q==
X-Gm-Message-State: AOAM531JZyfMqsW4IEu7KExdtnk+Ma+JN2L8OZU+fg/8Mh0S1BZY7pY6
        fp1O/0uwyHJmbMpUmZCktCo5ug==
X-Google-Smtp-Source: ABdhPJzPVTeNIa7Dd7sCbijNk5bhe2lPxQCPWQsLYj7m8pHQ/fNLg1yprsF38+74EGarJ5APFecNOg==
X-Received: by 2002:aa7:9f5a:: with SMTP id h26mr642830pfr.51.1590096395038;
        Thu, 21 May 2020 14:26:35 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id d18sm5201678pfq.136.2020.05.21.14.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 14:26:34 -0700 (PDT)
Date:   Thu, 21 May 2020 15:26:32 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org
Subject: Re: [PATCH v3 3/3] remoteproc: Add coredump debugfs entry
Message-ID: <20200521212632.GA19013@xps15>
References: <1589486856-23440-1-git-send-email-rishabhb@codeaurora.org>
 <1589486856-23440-4-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589486856-23440-4-git-send-email-rishabhb@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, May 14, 2020 at 01:07:36PM -0700, Rishabh Bhatnagar wrote:
> Add coredump debugfs entry to configure the type of dump that will
> be collected during recovery. User can select between default or
> inline coredump functionality. Also coredump collection can be
> disabled through this interface.
> This functionality can be configured differently for different
> remote processors.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_debugfs.c | 86 +++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> index 732770e..2f611de 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -28,6 +28,90 @@
>  static struct dentry *rproc_dbg;
>  
>  /*
> + * A coredump-configuration-to-string lookup table, for exposing a
> + * human readable configuration via debugfs. Always keep in sync with
> + * enum rproc_coredump_mechanism
> + */
> +static const char * const rproc_coredump_str[] = {
> +	[COREDUMP_DEFAULT]	= "default",
> +	[COREDUMP_INLINE]	= "inline",
> +	[COREDUMP_DISABLED]	= "disabled",
> +};
> +
> +/* Expose the current coredump configuration via debugfs */
> +static ssize_t rproc_coredump_read(struct file *filp, char __user *userbuf,
> +				    size_t count, loff_t *ppos)
> +{
> +	struct rproc *rproc = filp->private_data;
> +	const char *buf = rproc_coredump_str[rproc->dump_conf];
> +
> +	return simple_read_from_buffer(userbuf, count, ppos, buf, strlen(buf));
> +}
> +
> +/*
> + * By writing to the 'coredump' debugfs entry, we control the behavior of the
> + * coredump mechanism dynamically. The default value of this entry is "default".
> + *
> + * The 'coredump' debugfs entry supports these commands:
> + *
> + * default:	This is the default coredump mechanism. When the remoteproc
> + *		crashes the entire coredump will be copied to a separate buffer
> + *		and exposed to userspace.
> + *
> + * inline:	The coredump will not be copied to a separate buffer and the
> + *		recovery process will have to wait until data is read by
> + *		userspace. But this avoid usage of extra memory.
> + *
> + * disabled:	This will disable coredump. Recovery will proceed without
> + *		collecting any dump.
> + */
> +static ssize_t rproc_coredump_write(struct file *filp,
> +				     const char __user *user_buf, size_t count,
> +				     loff_t *ppos)
> +{
> +	struct rproc *rproc = filp->private_data;
> +	int ret, err = 0;
> +	char buf[20];
> +
> +	if (count > sizeof(buf))
> +		return -EINVAL;
> +
> +	ret = copy_from_user(buf, user_buf, count);
> +	if (ret)
> +		return -EFAULT;
> +
> +	/* remove end of line */
> +	if (buf[count - 1] == '\n')
> +		buf[count - 1] = '\0';
> +
> +	if (rproc->state == RPROC_CRASHED) {
> +		dev_err(&rproc->dev, "can't change coredump configuration\n");
> +		err = -EBUSY;
> +		goto out;
> +	}
> +
> +	if (!strncmp(buf, "disable", count))
> +		rproc->dump_conf = COREDUMP_DISABLED;
> +	else if (!strncmp(buf, "inline", count))
> +		rproc->dump_conf = COREDUMP_INLINE;
> +	else if (!strncmp(buf, "default", count))
> +		rproc->dump_conf = COREDUMP_DEFAULT;
> +	else {
> +		dev_err(&rproc->dev, "Invalid coredump configuration\n");
> +		err = -EINVAL;
> +	}
> +out:
> +	return err ? err : count;
> +}
> +
> +static const struct file_operations rproc_coredump_fops = {
> +	.read = rproc_coredump_read,
> +	.write = rproc_coredump_write,
> +	.open = simple_open,
> +	.llseek = generic_file_llseek,
> +};
> +
> +/*
>   * Some remote processors may support dumping trace logs into a shared
>   * memory buffer. We expose this trace buffer using debugfs, so users
>   * can easily tell what's going on remotely.
> @@ -337,6 +421,8 @@ void rproc_create_debug_dir(struct rproc *rproc)
>  			    rproc, &rproc_rsc_table_fops);
>  	debugfs_create_file("carveout_memories", 0400, rproc->dbg_dir,
>  			    rproc, &rproc_carveouts_fops);
> +	debugfs_create_file("coredump", 0600, rproc->dbg_dir,
> +			    rproc, &rproc_coredump_fops);

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  }
>  
>  void __init rproc_init_debugfs(void)
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
