Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61B4E198076
	for <lists+linux-remoteproc@lfdr.de>; Mon, 30 Mar 2020 18:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728738AbgC3QG0 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 30 Mar 2020 12:06:26 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:32782 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727048AbgC3QG0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Mar 2020 12:06:26 -0400
Received: by mail-io1-f68.google.com with SMTP id o127so18347020iof.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Mar 2020 09:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5bpA+uRoS/xe1TwgteXV8ewe8pRcRq8994ynAclRq9k=;
        b=zg0kJwviZ8ywmhJ/+iqExvFo0kWah9E2N2+mhaTXVOgTvy87nxb7qU7388NFfwtXQ2
         bWeD+H2L4fCMWBLgSrZOsSXl/rYZpAKNWBwYp8J/eEKHFEZbRvH4sTApiipPE1lq3FYb
         PPBLHdDGqr6+gKTCUWKUhrjNgaDXvQIQYTIv25Wg0j6dbGRsUlO0xF10kxSb/dGOygYv
         cOxNRn3RGedI+dwnAghT8fL3OrexhcJifX1pMjyyuBPccb/NvFuTEw5kTjGSsgGxSyIE
         zUsTbRqcM2ZDj7xm7Nu/m0KP/l6SgeD3nQSvVLv8ZCm9AOGB6xoQEfTyA79gd/OWejlC
         uitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5bpA+uRoS/xe1TwgteXV8ewe8pRcRq8994ynAclRq9k=;
        b=rnMJk9JX3dEj+xT7PMZjGfUCkgUko2Smi1BtCGGH8GOerGo95WAYzOXDUePkv3R/Vb
         OAQAgaWBP0bF4kjZ+7Q7NrcUK6PKgl7xjDXl2NWFlIemvCLKvjq/QcLUTMDL/UXQs0HB
         D+QgwYUsSRSk0LEL9Hc+Z/LzMbJ2UhbtF96QeaUG2BmWd/9d/rek2EXIKIr5EsjawPoo
         tRvsTO0IvbtaOsZgFYVFqqxz+0SqA3nwLv3dZZiehcgcdKffAT7oONmwf8bwqZwMeR7d
         BSTB+x0GgotczVeC4Ae1YbuNRDuUZ7BTOEfFE/l2uubZwpN3hsQ7CKTJ6+lbp0/oNOE5
         67kA==
X-Gm-Message-State: ANhLgQ2hGB5Qjb8S5x2WW2D197k4wz3SwcgdK8jXsiqFqVr2ztyDJlJr
        ezQqOG3UDNr4bkOZYOuml/4Nh982NNz4LLUVeJjz4w==
X-Google-Smtp-Source: ADFU+vsqGo8yZ32IiYI1KIdUaJMtleuq/WxCA4CMDFl1e7rZRmFNPE8oYyxl9rpU2tiR3KPWU2xaEwlbqdQ44FkyFM0=
X-Received: by 2002:a02:a1c2:: with SMTP id o2mr11273993jah.98.1585584385286;
 Mon, 30 Mar 2020 09:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <1585357147-4616-1-git-send-email-rishabhb@codeaurora.org>
In-Reply-To: <1585357147-4616-1-git-send-email-rishabhb@codeaurora.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 30 Mar 2020 10:06:12 -0600
Message-ID: <CANLsYkxV7xWUkggBXF=ziGfmLs-EZewuzCzZ3fq56CR+xA0poQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] remoteproc: qcom: Add bus scaling capability during bootup
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        Siddharth Gupta <sidgup@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Rishabh,

On Fri, 27 Mar 2020 at 18:59, Rishabh Bhatnagar <rishabhb@codeaurora.org> wrote:
>
> During bootup since remote processors cannot request for
> additional bus bandwidth from the interconect framework,
> platform driver should provide the proxy resources. This
> is useful for scenarios where the Q6 tries to access the DDR
> memory in the initial stages of bootup. For e.g. during
> bootup or after recovery modem Q6 tries to zero out the bss
> section in the DDR. Since this is a big chunk of memory if
> don't bump up the bandwidth we might encounter timeout issues.
> This patch makes a proxy vote for maximizing the bus bandwidth
> during bootup and removes it once processor is up.
>
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>

The title of this patch contains "[PATCH 1/2]" but only one patch was
sent to the linux-remoteproc mailing list.  Is this a mistake and this
is a stand alone patch or another patch did not reach the list?

Thanks,
Mathieu

> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 43 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index edf9d0e..8f5db8d 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -20,6 +20,7 @@
>  #include <linux/qcom_scm.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/remoteproc.h>
> +#include <linux/interconnect.h>
>  #include <linux/soc/qcom/mdt_loader.h>
>  #include <linux/soc/qcom/smem.h>
>  #include <linux/soc/qcom/smem_state.h>
> @@ -28,6 +29,9 @@
>  #include "qcom_q6v5.h"
>  #include "remoteproc_internal.h"
>
> +#define PIL_TZ_AVG_BW  0
> +#define PIL_TZ_PEAK_BW UINT_MAX
> +
>  struct adsp_data {
>         int crash_reason_smem;
>         const char *firmware_name;
> @@ -62,6 +66,7 @@ struct qcom_adsp {
>         int proxy_pd_count;
>
>         int pas_id;
> +       struct icc_path *bus_client;
>         int crash_reason_smem;
>         bool has_aggre2_clk;
>
> @@ -124,6 +129,25 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
>
>  }
>
> +static int do_bus_scaling(struct qcom_adsp *adsp, bool enable)
> +{
> +       int rc;
> +       u32 avg_bw = enable ? PIL_TZ_AVG_BW : 0;
> +       u32 peak_bw = enable ? PIL_TZ_PEAK_BW : 0;
> +
> +       if (adsp->bus_client) {
> +               rc = icc_set_bw(adsp->bus_client, avg_bw, peak_bw);
> +               if (rc) {
> +                       dev_err(adsp->dev, "bandwidth request failed(rc:%d)\n",
> +                               rc);
> +                       return rc;
> +               }
> +       } else
> +               dev_info(adsp->dev, "Bus scaling not setup for %s\n",
> +                       adsp->rproc->name);
> +       return 0;
> +}
> +
>  static int adsp_start(struct rproc *rproc)
>  {
>         struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
> @@ -131,9 +155,13 @@ static int adsp_start(struct rproc *rproc)
>
>         qcom_q6v5_prepare(&adsp->q6v5);
>
> +       ret = do_bus_scaling(adsp, true);
> +       if (ret)
> +               goto disable_irqs;
> +
>         ret = adsp_pds_enable(adsp, adsp->active_pds, adsp->active_pd_count);
>         if (ret < 0)
> -               goto disable_irqs;
> +               goto unscale_bus;
>
>         ret = adsp_pds_enable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
>         if (ret < 0)
> @@ -183,6 +211,8 @@ static int adsp_start(struct rproc *rproc)
>         adsp_pds_disable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
>  disable_active_pds:
>         adsp_pds_disable(adsp, adsp->active_pds, adsp->active_pd_count);
> +unscale_bus:
> +       do_bus_scaling(adsp, false);
>  disable_irqs:
>         qcom_q6v5_unprepare(&adsp->q6v5);
>
> @@ -198,6 +228,7 @@ static void qcom_pas_handover(struct qcom_q6v5 *q6v5)
>         clk_disable_unprepare(adsp->aggre2_clk);
>         clk_disable_unprepare(adsp->xo);
>         adsp_pds_disable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
> +       do_bus_scaling(adsp, false);
>  }
>
>  static int adsp_stop(struct rproc *rproc)
> @@ -280,6 +311,14 @@ static int adsp_init_regulator(struct qcom_adsp *adsp)
>         return PTR_ERR_OR_ZERO(adsp->px_supply);
>  }
>
> +static void adsp_init_bus_scaling(struct qcom_adsp *adsp)
> +{
> +       adsp->bus_client = of_icc_get(adsp->dev, NULL);
> +       if (!adsp->bus_client)
> +               dev_warn(adsp->dev, "%s: unable to get bus client \n",
> +                       __func__);
> +}
> +
>  static int adsp_pds_attach(struct device *dev, struct device **devs,
>                            char **pd_names)
>  {
> @@ -410,6 +449,8 @@ static int adsp_probe(struct platform_device *pdev)
>         if (ret)
>                 goto free_rproc;
>
> +       adsp_init_bus_scaling(adsp);
> +
>         ret = adsp_pds_attach(&pdev->dev, adsp->active_pds,
>                               desc->active_pd_names);
>         if (ret < 0)
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
