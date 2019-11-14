Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E65B7FCD21
	for <lists+linux-remoteproc@lfdr.de>; Thu, 14 Nov 2019 19:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727695AbfKNSTP (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 14 Nov 2019 13:19:15 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38431 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727784AbfKNSTM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Nov 2019 13:19:12 -0500
Received: by mail-pg1-f196.google.com with SMTP id 15so4297464pgh.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Nov 2019 10:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Wyk4KJjderVkyJv8jW+hlPmwUBgxY2V/mVNctLCR9Ow=;
        b=ijf4t7dVYEb1OA4t94tKguoTQINdHNQfZ3AWgU61iTrqpzii9bh/Ahxlbw80p/apHH
         sbZMfRH8ASFk500eabsjl8L85FLqiJweRSGbIMFLuoJ3U+NEHJVMyx5vFMLKUMoAZBXL
         f7/c3h+zrjtU41qsn1KWObAB7xCKrU5AtBxlXObZ9yE7uMmFH2o/1Mke5iDDK9dFbZWo
         yj2mUBxLyPYD/R9A7BQO8aOY588SZg7UWqqoo+75nif01GcgNRssKJWPswYompCndnPj
         LgdNaGYwB4JhZVCAg4IhMcoUE4nTnalkyoOTezggcWknOaV6RIkJiy5HmWnvtSw3ZO9z
         a+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Wyk4KJjderVkyJv8jW+hlPmwUBgxY2V/mVNctLCR9Ow=;
        b=UPNJQGJmAatuNlh43PZI+sLI8JbXvNLoPltdUwNwA0WGNBOWN1bhOjKMWRulcX2yj4
         o+khAKcu0OlbkeVZhuYqjiYAiNorhT6vcMQ7D/F+FkAxq6xbjoljRaykQEKRJlI0RW7I
         UGCTxgY7O1e6P3LcUeiP2Z/IqzNq6pnxkmPRBEt70KDG0GSMAYJm1Q2U+BUAdLAbKK8K
         n2Zu+O0DIPdzWpWTLAXLlEWxagriFCPDniKrtAKBmOxBFslvVLvcv1HWKHVKvnHIkbOD
         4duwG5hT0/EcPcQHS58ENQYt7SQty15Ntkmrfny2e3c5vxEMI5F2YMEYUoaQkbQaRfl4
         A3/g==
X-Gm-Message-State: APjAAAUO9koK9BINy357u56PCImTPDfv3JX/p6DSzpfds2evUsjD3LHj
        fFl8jPTA5DHX0ZCINhKJhVq4xg==
X-Google-Smtp-Source: APXvYqwSsSibKPWmLyY4huZnbRLauH9G/TmbBV0vD+DyeC3zqZO9AkPvZYtHtC+gdHCZhNmtOCl7vg==
X-Received: by 2002:a63:7b5c:: with SMTP id k28mr12125525pgn.442.1573755551568;
        Thu, 14 Nov 2019 10:19:11 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id k17sm4293181pgb.64.2019.11.14.10.19.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2019 10:19:11 -0800 (PST)
Date:   Thu, 14 Nov 2019 11:19:09 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Loic Pallardy <loic.pallardy@st.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org,
        fabien.dessenne@st.com, s-anna@ti.com
Subject: Re: [PATCH v3 1/1] remoteproc: add support for co-processor loaded
 and booted before kernel
Message-ID: <20191114181909.GA21402@xps15>
References: <1573680543-39086-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573680543-39086-1-git-send-email-loic.pallardy@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Loic,

On Wed, Nov 13, 2019 at 10:29:03PM +0100, Loic Pallardy wrote:
> Remote processor could boot independently or be loaded/started before
> Linux kernel by bootloader or any firmware.
> This patch introduces a new property in rproc core, named skip_fw_load,
> to be able to allocate resources and sub-devices like vdev and to
> synchronize with current state without loading firmware from file system.
> It is platform driver responsibility to implement the right firmware
> load ops according to HW specificities.
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> 
> ---
> Change from v2:
> - rename property into skip_fw_load
> - update rproc_boot and rproc_fw_boot description
> - update commit message
> Change from v1:
> - Keep bool in struct rproc
> ---
>  drivers/remoteproc/remoteproc_core.c | 51 +++++++++++++++++++++++++++---------
>  include/linux/remoteproc.h           |  2 ++
>  2 files changed, 40 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 3c5fbbbfb0f1..585cdca8b241 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1360,7 +1360,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  }
>  
>  /*
> - * take a firmware and boot a remote processor with it.
> + * Handle resources defined in resource table and start a remote processor.
>   */
>  static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  {
> @@ -1372,7 +1372,11 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  	if (ret)
>  		return ret;
>  
> -	dev_info(dev, "Booting fw image %s, size %zd\n", name, fw->size);
> +	if (fw)
> +		dev_info(dev, "Booting fw image %s, size %zd\n", name,
> +			 fw->size);
> +	else
> +		dev_info(dev, "Synchronizing with preloaded co-processor\n");

Here we assume that if @fw is NULL then the image is already loaded.  The first
question that comes to mind is if that means the ELF image has already been
copied to the coprocessor's boot address.  If that is the case it would be nice
to make it explicit with a comment in the code.

Following the earlier comments made on the thread for this serie, I understand
the rproc_ops fed to the core should provision for @fw being NULL.  In
this case though st_rproc_ops[1] reference a number of core operations that
aren't tailored to handled a NULL @fw parameter. 

I am pretty sure you're well aware of this and you have more patches to go with
this one or said patches have already been published and I'm looking at the
wrong tree. If that is the case would you mind making those patches public or
pointing me to a repository somewhere?

I have other concerns about the specifics shared between the application and co
processors using the ELF image but I'll wait for your reply to the above before
addressing those.

Regards,
Mathieu

[1]. https://elixir.bootlin.com/linux/v5.4-rc7/source/drivers/remoteproc/stm32_rproc.c#L470 

>  
>  	/*
>  	 * if enabling an IOMMU isn't relevant for this rproc, this is
> @@ -1719,16 +1723,22 @@ static void rproc_crash_handler_work(struct work_struct *work)
>   * rproc_boot() - boot a remote processor
>   * @rproc: handle of a remote processor
>   *
> - * Boot a remote processor (i.e. load its firmware, power it on, ...).
> + * Boot a remote processor (i.e. load its firmware, power it on, ...) from
> + * different contexts:
> + * - power off
> + * - preloaded firmware
> + * - started before kernel execution
> + * The different operations are selected thanks to properties defined by
> + * platform driver.
>   *
> - * If the remote processor is already powered on, this function immediately
> - * returns (successfully).
> + * If the remote processor is already powered on at rproc level, this function
> + * immediately returns (successfully).
>   *
>   * Returns 0 on success, and an appropriate error value otherwise.
>   */
>  int rproc_boot(struct rproc *rproc)
>  {
> -	const struct firmware *firmware_p;
> +	const struct firmware *firmware_p = NULL;
>  	struct device *dev;
>  	int ret;
>  
> @@ -1759,11 +1769,17 @@ int rproc_boot(struct rproc *rproc)
>  
>  	dev_info(dev, "powering up %s\n", rproc->name);
>  
> -	/* load firmware */
> -	ret = request_firmware(&firmware_p, rproc->firmware, dev);
> -	if (ret < 0) {
> -		dev_err(dev, "request_firmware failed: %d\n", ret);
> -		goto downref_rproc;
> +	if (!rproc->skip_fw_load) {
> +		/* load firmware */
> +		ret = request_firmware(&firmware_p, rproc->firmware, dev);
> +		if (ret < 0) {
> +			dev_err(dev, "request_firmware failed: %d\n", ret);
> +			goto downref_rproc;
> +		}
> +	} else {
> +		/* set firmware name to null as unknown */
> +		kfree(rproc->firmware);
> +		rproc->firmware = NULL;
>  	}
>  
>  	ret = rproc_fw_boot(rproc, firmware_p);
> @@ -1917,8 +1933,17 @@ int rproc_add(struct rproc *rproc)
>  	/* create debugfs entries */
>  	rproc_create_debug_dir(rproc);
>  
> -	/* if rproc is marked always-on, request it to boot */
> -	if (rproc->auto_boot) {
> +	if (rproc->skip_fw_load) {
> +		/*
> +		 * If rproc is marked already booted, no need to wait
> +		 * for firmware.
> +		 * Just handle associated resources and start sub devices
> +		 */
> +		ret = rproc_boot(rproc);
> +		if (ret < 0)
> +			return ret;
> +	} else if (rproc->auto_boot) {
> +		/* if rproc is marked always-on, request it to boot */
>  		ret = rproc_trigger_auto_boot(rproc);
>  		if (ret < 0)
>  			return ret;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 16ad66683ad0..4fd5bedab4fa 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -479,6 +479,7 @@ struct rproc_dump_segment {
>   * @table_sz: size of @cached_table
>   * @has_iommu: flag to indicate if remote processor is behind an MMU
>   * @auto_boot: flag to indicate if remote processor should be auto-started
> + * @skip_fw_load: remote processor has been preloaded before start sequence
>   * @dump_segments: list of segments in the firmware
>   * @nb_vdev: number of vdev currently handled by rproc
>   */
> @@ -512,6 +513,7 @@ struct rproc {
>  	size_t table_sz;
>  	bool has_iommu;
>  	bool auto_boot;
> +	bool skip_fw_load;
>  	struct list_head dump_segments;
>  	int nb_vdev;
>  };
> -- 
> 2.7.4
> 
