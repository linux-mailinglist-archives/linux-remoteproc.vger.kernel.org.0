Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B02E1DA5FE
	for <lists+linux-remoteproc@lfdr.de>; Wed, 20 May 2020 02:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbgETADX (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 19 May 2020 20:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728100AbgETADW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 May 2020 20:03:22 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB99C061A0E
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2020 17:03:22 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x15so706703pfa.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2020 17:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fSJkAGun6VBhvCEY/QLJy5VObeT/msEvMdxQSvD5yJY=;
        b=saTe6VGFUSFUzJ9TtP/KyD3meElDSkHDQZL3G2/nFmOQ+CpjX53/AADT5EXXXrQEN7
         oDay12drh5+x1ebwehs3y6wg4M169/Ly2LHe+6D/w0efhgIJB/UsCioRyRcF/qi2+gZi
         NDu23Upjgi4sRvR4x+ZLRb48ZpqSFvVkCTyFVn+D9qVNQpMdYN+jJCYKL4xpciAHtYLf
         9dxOkcYTJxEhnggBBSyyVpG/iul9sHlYoF1mUqRNa19plu3fB8QIYpiE/AuCTIk17I9E
         H4ZDbgoUTT0ywZzO578dObMKg0lzYGA2XFGMjpvusSH5lsBpJtw6xgDDfcj7LmU5qVW3
         SrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fSJkAGun6VBhvCEY/QLJy5VObeT/msEvMdxQSvD5yJY=;
        b=K1h0xWDAZH2YI+O3yYKwf32WGeo/SeaHXWBijst25VKTdIVAcdAZTPFQqObk/xOy3S
         wCNXGgasBfpu0P2ofn6GHJuUk+0zgtt2PpzakN5TKG54MxlGuG/LifSQyPhOjs6VDBHD
         mP2DHEVOnGXg+oloKIQBVvgBZZ8PjJgI6VbyEsxJdFmgjx+F0zSQkMmikRzOBi4j37Hn
         MkqUkXjaQqZY5pjrGzPHTjy5gtyBJg9UFLbmzj58x5rVh87uKCzZGzirYPXnMpXOG61S
         Kv13cvI0KLQU8ocChCqnFaTwMDfnIXsL1WMumpqDG1V6zxvxJfXHznOnAqC3FA25bR84
         ildQ==
X-Gm-Message-State: AOAM5304dxxPHtcOm6ajlRxPh0y8ysnFpkvfphyZxSVkfagtkqDIitAw
        roQHAp9FCUWjPo6uDZ52rpUIvw==
X-Google-Smtp-Source: ABdhPJzwsfKESU7tMLNvPWwIL3TtS7pxj1YU+Dzs+fX9P2BjYix6hLvwQPrrT8yyxcVsHgUg1b6XSA==
X-Received: by 2002:aa7:819a:: with SMTP id g26mr1545963pfi.193.1589933001899;
        Tue, 19 May 2020 17:03:21 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f21sm496288pfn.71.2020.05.19.17.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 17:03:21 -0700 (PDT)
Date:   Tue, 19 May 2020 17:02:00 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mathieu.poirier@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org
Subject: Re: [PATCH v3 3/3] remoteproc: Add coredump debugfs entry
Message-ID: <20200520000200.GG408178@builder.lan>
References: <1589486856-23440-1-git-send-email-rishabhb@codeaurora.org>
 <1589486856-23440-4-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589486856-23440-4-git-send-email-rishabhb@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 14 May 13:07 PDT 2020, Rishabh Bhatnagar wrote:

> Add coredump debugfs entry to configure the type of dump that will
> be collected during recovery. User can select between default or
> inline coredump functionality. Also coredump collection can be
> disabled through this interface.
> This functionality can be configured differently for different
> remote processors.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

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
>  }
>  
>  void __init rproc_init_debugfs(void)
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
