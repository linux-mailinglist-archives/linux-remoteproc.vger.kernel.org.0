Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A0E2194BA
	for <lists+linux-remoteproc@lfdr.de>; Thu,  9 Jul 2020 01:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgGHX5A (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 8 Jul 2020 19:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbgGHX5A (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 8 Jul 2020 19:57:00 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26634C061A0B
        for <linux-remoteproc@vger.kernel.org>; Wed,  8 Jul 2020 16:56:53 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id i4so417956iov.11
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jul 2020 16:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZRaUaMMq2NTXjJUKetKgW8D+EKDseJLjkujRcuo8Oco=;
        b=a6e366iLytZJ+53w6DtVoO8ImHdegEp7g+5YUmJhcLm4x72b+za+0Gt1jzdFkI/F1W
         ak+9BADB67F5Aue7JKLs0Qgk7CT2hNu3ThD9U8fjGT+MH8skriOTakqKjpD8gDGNYDwm
         pXcr4/hGMfjyZ1ceWjYxGf+WC/3ClNxI45NQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZRaUaMMq2NTXjJUKetKgW8D+EKDseJLjkujRcuo8Oco=;
        b=d5Q4VwEewf3ZgV2cD38cFtmtOZHQ4ih4+5DdYnFMReqWAceJMDZrRJbaWFWUcKoY3v
         UpNtQ1nqEYJEdSsX4U1J8YaFZQanc5Q2s09ud1JVznHS8daSuE9/0hXUEXMiYcqcE9Xo
         mkOBD3xN3u0kyBy5LAig3QE0ia5ZL0WjwDTvwvydfhPTGZ7xvxJfvVlgU79XU8fXjmPf
         7G8vsA+ujfRLuXc0bauldSj20Rbt2drvrz1fIdnr8U0JhjjNclPi/cpoUkn3VerQ2B5D
         uHduDXSMVn9bZ+WiVtQKDtC9Ov3GbClsxhNfc68bVxaroCraZ4m/na9CaGAUhWA+O2sD
         nmvA==
X-Gm-Message-State: AOAM5339uta+5Yc/7xbEbEN0HOjEUR0EQ2fEhTb3s5AMemEQcVAwT2b3
        zsa/cLj9PHGmVi1kSY8k5xHeKQ==
X-Google-Smtp-Source: ABdhPJweX92mROv9x8e8TpUr4RoI8mb28yiepJXi41CMEPAB/p4TSNx3KzwbZ9hmfsdNkeCCYF6nGA==
X-Received: by 2002:a05:6602:2555:: with SMTP id j21mr19658304ioe.11.1594252612260;
        Wed, 08 Jul 2020 16:56:52 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id v16sm1231504iow.19.2020.07.08.16.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 16:56:51 -0700 (PDT)
Subject: Re: [PATCH v6 1/2] remoteproc: qcom: Add per subsystem SSR
 notification
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org
References: <1592965408-16908-1-git-send-email-rishabhb@codeaurora.org>
 <1592965408-16908-2-git-send-email-rishabhb@codeaurora.org>
From:   Alex Elder <elder@ieee.org>
Message-ID: <7c2b9088-75be-b45c-0d55-4ac026a01090@ieee.org>
Date:   Wed, 8 Jul 2020 18:56:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1592965408-16908-2-git-send-email-rishabhb@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 6/23/20 9:23 PM, Rishabh Bhatnagar wrote:
> Currently there is a single notification chain which is called whenever any
> remoteproc shuts down. This leads to all the listeners being notified, and
> is not an optimal design as kernel drivers might only be interested in
> listening to notifications from a particular remoteproc. Create a global
> list of remoteproc notification info data structures. This will hold the
> name and notifier_list information for a particular remoteproc. The API
> to register for notifications will use name argument to retrieve the
> notification info data structure and the notifier block will be added to
> that data structure's notification chain. Also move from blocking notifier
> to srcu notifer based implementation to support dynamic notifier head
> creation.

You misspelled "cookie" (coookie) but please fix that later.

I did not look as closely at this as I did last time.  However
I *did* do a quick implementation in the IPA driver of using
this instead of the IPA notification code, and it should be
a straightforward conversion.

I'm going to call this good...

Reviewed-by: Alex Elder <elder@linaro.org>



> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_common.c      | 90 ++++++++++++++++++++++++++++++-----
>  drivers/remoteproc/qcom_common.h      |  5 +-
>  include/linux/remoteproc/qcom_rproc.h | 20 ++++++--
>  3 files changed, 95 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 9028cea..7a7384c 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/notifier.h>
>  #include <linux/remoteproc.h>
> +#include <linux/remoteproc/qcom_rproc.h>
>  #include <linux/rpmsg/qcom_glink.h>
>  #include <linux/rpmsg/qcom_smd.h>
>  #include <linux/soc/qcom/mdt_loader.h>
> @@ -23,7 +24,14 @@
>  #define to_smd_subdev(d) container_of(d, struct qcom_rproc_subdev, subdev)
>  #define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
>  
> -static BLOCKING_NOTIFIER_HEAD(ssr_notifiers);
> +struct qcom_ssr_subsystem {
> +	const char *name;
> +	struct srcu_notifier_head notifier_list;
> +	struct list_head list;
> +};
> +
> +static LIST_HEAD(qcom_ssr_subsystem_list);
> +static DEFINE_MUTEX(qcom_ssr_subsys_lock);
>  
>  static int glink_subdev_start(struct rproc_subdev *subdev)
>  {
> @@ -189,37 +197,83 @@ void qcom_remove_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd)
>  }
>  EXPORT_SYMBOL_GPL(qcom_remove_smd_subdev);
>  
> +static struct qcom_ssr_subsystem *qcom_ssr_get_subsys(const char *name)
> +{
> +	struct qcom_ssr_subsystem *info;
> +
> +	mutex_lock(&qcom_ssr_subsys_lock);
> +	/* Match in the global qcom_ssr_subsystem_list with name */
> +	list_for_each_entry(info, &qcom_ssr_subsystem_list, list)
> +		if (!strcmp(info->name, name))
> +			goto out;
> +
> +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> +	if (!info) {
> +		info = ERR_PTR(-ENOMEM);
> +		goto out;
> +	}
> +	info->name = kstrdup_const(name, GFP_KERNEL);
> +	srcu_init_notifier_head(&info->notifier_list);
> +
> +	/* Add to global notification list */
> +	list_add_tail(&info->list, &qcom_ssr_subsystem_list);
> +
> +out:
> +	mutex_unlock(&qcom_ssr_subsys_lock);
> +	return info;
> +}
> +
>  /**
>   * qcom_register_ssr_notifier() - register SSR notification handler
> - * @nb:		notifier_block to notify for restart notifications
> + * @name:	Subsystem's SSR name
> + * @nb:		notifier_block to be invoked upon subsystem's state change
>   *
> - * Returns 0 on success, negative errno on failure.
> + * This registers the @nb notifier block as part the notifier chain for a
> + * remoteproc associated with @name. The notifier block's callback
> + * will be invoked when the remote processor's SSR events occur
> + * (pre/post startup and pre/post shutdown).
>   *
> - * This register the @notify function as handler for restart notifications. As
> - * remote processors are stopped this function will be called, with the SSR
> - * name passed as a parameter.
> + * Return: a subsystem cookie on success, ERR_PTR on failure.
>   */
> -int qcom_register_ssr_notifier(struct notifier_block *nb)
> +void *qcom_register_ssr_notifier(const char *name, struct notifier_block *nb)
>  {
> -	return blocking_notifier_chain_register(&ssr_notifiers, nb);
> +	struct qcom_ssr_subsystem *info;
> +
> +	info = qcom_ssr_get_subsys(name);
> +	if (IS_ERR(info))
> +		return info;
> +
> +	srcu_notifier_chain_register(&info->notifier_list, nb);
> +
> +	return &info->notifier_list;
>  }
>  EXPORT_SYMBOL_GPL(qcom_register_ssr_notifier);
>  
>  /**
>   * qcom_unregister_ssr_notifier() - unregister SSR notification handler
> + * @notify:	subsystem coookie returned from qcom_register_ssr_notifier
>   * @nb:		notifier_block to unregister
> + *
> + * This function will unregister the notifier from the particular notifier
> + * chain.
> + *
> + * Return: 0 on success, %ENOENT otherwise.
>   */
> -void qcom_unregister_ssr_notifier(struct notifier_block *nb)
> +int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb)
>  {
> -	blocking_notifier_chain_unregister(&ssr_notifiers, nb);
> +	return srcu_notifier_chain_unregister(notify, nb);
>  }
>  EXPORT_SYMBOL_GPL(qcom_unregister_ssr_notifier);
>  
>  static void ssr_notify_unprepare(struct rproc_subdev *subdev)
>  {
>  	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> +	struct qcom_ssr_notify_data data = {
> +		.name = ssr->info->name,
> +		.crashed = false,
> +	};
>  
> -	blocking_notifier_call_chain(&ssr_notifiers, 0, (void *)ssr->name);
> +	srcu_notifier_call_chain(&ssr->info->notifier_list, 0, &data);
>  }
>  
>  /**
> @@ -229,12 +283,21 @@ static void ssr_notify_unprepare(struct rproc_subdev *subdev)
>   * @ssr_name:	identifier to use for notifications originating from @rproc
>   *
>   * As the @ssr is registered with the @rproc SSR events will be sent to all
> - * registered listeners in the system as the remoteproc is shut down.
> + * registered listeners for the remoteproc when it's SSR events occur
> + * (pre/post startup and pre/post shutdown).
>   */
>  void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
>  			 const char *ssr_name)
>  {
> -	ssr->name = ssr_name;
> +	struct qcom_ssr_subsystem *info;
> +
> +	info = qcom_ssr_get_subsys(ssr_name);
> +	if (IS_ERR(info)) {
> +		dev_err(&rproc->dev, "Failed to add ssr subdevice\n");
> +		return;
> +	}
> +
> +	ssr->info = info;
>  	ssr->subdev.unprepare = ssr_notify_unprepare;
>  
>  	rproc_add_subdev(rproc, &ssr->subdev);
> @@ -249,6 +312,7 @@ EXPORT_SYMBOL_GPL(qcom_add_ssr_subdev);
>  void qcom_remove_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr)
>  {
>  	rproc_remove_subdev(rproc, &ssr->subdev);
> +	ssr->info = NULL;
>  }
>  EXPORT_SYMBOL_GPL(qcom_remove_ssr_subdev);
>  
> diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
> index 34e5188..dfc641c 100644
> --- a/drivers/remoteproc/qcom_common.h
> +++ b/drivers/remoteproc/qcom_common.h
> @@ -26,10 +26,11 @@ struct qcom_rproc_subdev {
>  	struct qcom_smd_edge *edge;
>  };
>  
> +struct qcom_ssr_subsystem;
> +
>  struct qcom_rproc_ssr {
>  	struct rproc_subdev subdev;
> -
> -	const char *name;
> +	struct qcom_ssr_subsystem *info;
>  };
>  
>  void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink,
> diff --git a/include/linux/remoteproc/qcom_rproc.h b/include/linux/remoteproc/qcom_rproc.h
> index fa8e386..2a1d6d0 100644
> --- a/include/linux/remoteproc/qcom_rproc.h
> +++ b/include/linux/remoteproc/qcom_rproc.h
> @@ -5,17 +5,27 @@ struct notifier_block;
>  
>  #if IS_ENABLED(CONFIG_QCOM_RPROC_COMMON)
>  
> -int qcom_register_ssr_notifier(struct notifier_block *nb);
> -void qcom_unregister_ssr_notifier(struct notifier_block *nb);
> +struct qcom_ssr_notify_data {
> +	const char *name;
> +	bool crashed;
> +};
> +
> +void *qcom_register_ssr_notifier(const char *name, struct notifier_block *nb);
> +int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb);
>  
>  #else
>  
> -static inline int qcom_register_ssr_notifier(struct notifier_block *nb)
> +static inline void *qcom_register_ssr_notifier(const char *name,
> +					       struct notifier_block *nb)
>  {
> -	return 0;
> +	return NULL;
>  }
>  
> -static inline void qcom_unregister_ssr_notifier(struct notifier_block *nb) {}
> +static inline int qcom_unregister_ssr_notifier(void *notify,
> +					       struct notifier_block *nb)
> +{
> +	return 0;
> +}
>  
>  #endif
>  
> 

