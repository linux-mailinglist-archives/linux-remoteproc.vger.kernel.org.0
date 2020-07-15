Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E60C2217AF
	for <lists+linux-remoteproc@lfdr.de>; Thu, 16 Jul 2020 00:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbgGOWTT (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 15 Jul 2020 18:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727047AbgGOWTT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 15 Jul 2020 18:19:19 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D425EC08C5CE
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jul 2020 15:19:18 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id y2so3979530ioy.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jul 2020 15:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uamVRmBnq/LyIAwWR9vTRtXE6KJjN16bes8FQWmt5qc=;
        b=LP9YnNKBDUyZc5hldm+tOuZM/Xv9Dq6jUSsWZh3iCZOkud47rfRGMe+VGiH1HmC9f9
         xNGiaCcq6okAfg1P08F+1dwmDew22YigqRGMFIE2XNBGjG+e29WOiWN+IrRdlArL2r7y
         zIvaW91RxDvXWsCJAv1vj8Pe0vzK4xq70ISaYWajxjaNCSYaIs0fv2RoRrSvGqt8gLxV
         /kW2vuuYIvgAJGPekOs73MICUoQ37PrUpC7k7DpWEJXwmsess9lxUuYgbIsOi7Qi3zIb
         byafvAUIQVyn8mMu2L301RALWXTA6C2xsI/0AT6nMN42UnLVD4JySNglI0ePaotrQGfv
         OZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uamVRmBnq/LyIAwWR9vTRtXE6KJjN16bes8FQWmt5qc=;
        b=Q2lzFP0tlHmZXYk++Zg89vZ9r82oWIbOjYlNTYxCRw4fP7VKcuhhRaieYqzuQTKO+C
         Mtz0DecmlB4qxzSbBWTrCrvXd/LrxK7vIPp4JY2u8uyZSrSfgRJELGrllhNK924FI7WZ
         MeLzNWwxeXwByu7sK4UC19aUYFBKPFnSdPPyeKJu5XDOLjYnvVJwnAXcWkQfW94Z8EQ7
         EqbI5IYwdwBQrT8U2CUkOK5RhslSnHo8U/eyMs7Y7ncVchEbyRiq6oHObjOieAIxnrh5
         07PLD4fL2vBTEPbgGLjyBiRgjz8v8tLb5SeJeNYGXWQfwdTFKNSKfZ4imEF+uGgK734v
         kimw==
X-Gm-Message-State: AOAM530Wuva8hBQHgBvdfcXwVYHmaPD+5sRUo9NHluf9HtbW1lppI9De
        tVBhCQ5mMRJhfChwR9X7qPI890EKETqtDb0MyrTvng==
X-Google-Smtp-Source: ABdhPJxanTTddn1ct1kSr/GGgdJAB/ArrrDHYsVVxx4CSGuJVHDOZIRP8qD8hAuix1aIu35jzjzgXUi0p+0yiT3+pyg=
X-Received: by 2002:a5d:8853:: with SMTP id t19mr1496520ios.73.1594851558125;
 Wed, 15 Jul 2020 15:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200707213112.928383-7-mathieu.poirier@linaro.org> <202007150455.m7mLaFaF%lkp@intel.com>
In-Reply-To: <202007150455.m7mLaFaF%lkp@intel.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 15 Jul 2020 16:19:07 -0600
Message-ID: <CANLsYkwWe_zfpafBKNF10BEqV4w1tHTjrTOPUca36LkTD+Nu=Q@mail.gmail.com>
Subject: Re: [PATCH v5 06/11] remoteproc: stm32: Properly set co-processor
 state when attaching
To:     kernel test robot <lkp@intel.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic PALLARDY <loic.pallardy@st.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Robot,

On Tue, 14 Jul 2020 at 14:31, kernel test robot <lkp@intel.com> wrote:
>
> Hi Mathieu,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on linux/master]
> [also build test ERROR on linus/master v5.8-rc5 next-20200714]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use  as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Mathieu-Poirier/remoteproc-stm32-Add-support-for-attaching-to-M4/20200708-053515
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 9ebcfadb0610322ac537dd7aa5d9cbc2b2894c68
> config: arm-randconfig-r011-20200714 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 02946de3802d3bc65bc9f2eb9b8d4969b5a7add8)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> drivers/remoteproc/stm32_rproc.c:697:18: error: use of undeclared identifier 'RPROC_DETACHED'
>                    rproc->state = RPROC_DETACHED;
>                                   ^
>    1 error generated.

This patchset depends on this one [1], something that is clearly
stated in the cover letter.  Compiling this set on top of [1]
generates no error.

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=318275

>
> vim +/RPROC_DETACHED +697 drivers/remoteproc/stm32_rproc.c
>
>    661
>    662
>    663  static int stm32_rproc_probe(struct platform_device *pdev)
>    664  {
>    665          struct device *dev = &pdev->dev;
>    666          struct stm32_rproc *ddata;
>    667          struct device_node *np = dev->of_node;
>    668          struct rproc *rproc;
>    669          unsigned int state;
>    670          int ret;
>    671
>    672          ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
>    673          if (ret)
>    674                  return ret;
>    675
>    676          rproc = rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
>    677          if (!rproc)
>    678                  return -ENOMEM;
>    679
>    680          ddata = rproc->priv;
>    681
>    682          rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
>    683
>    684          ret = stm32_rproc_parse_dt(pdev, ddata, &rproc->auto_boot);
>    685          if (ret)
>    686                  goto free_rproc;
>    687
>    688          ret = stm32_rproc_of_memory_translations(pdev, ddata);
>    689          if (ret)
>    690                  goto free_rproc;
>    691
>    692          ret = stm32_rproc_get_m4_status(ddata, &state);
>    693          if (ret)
>    694                  goto free_rproc;
>    695
>    696          if (state == M4_STATE_CRUN)
>  > 697                  rproc->state = RPROC_DETACHED;
>    698
>    699          rproc->has_iommu = false;
>    700          ddata->workqueue = create_workqueue(dev_name(dev));
>    701          if (!ddata->workqueue) {
>    702                  dev_err(dev, "cannot create workqueue\n");
>    703                  ret = -ENOMEM;
>    704                  goto free_rproc;
>    705          }
>    706
>    707          platform_set_drvdata(pdev, rproc);
>    708
>    709          ret = stm32_rproc_request_mbox(rproc);
>    710          if (ret)
>    711                  goto free_wkq;
>    712
>    713          ret = rproc_add(rproc);
>    714          if (ret)
>    715                  goto free_mb;
>    716
>    717          return 0;
>    718
>    719  free_mb:
>    720          stm32_rproc_free_mbox(rproc);
>    721  free_wkq:
>    722          destroy_workqueue(ddata->workqueue);
>    723  free_rproc:
>    724          if (device_may_wakeup(dev)) {
>    725                  dev_pm_clear_wake_irq(dev);
>    726                  device_init_wakeup(dev, false);
>    727          }
>    728          rproc_free(rproc);
>    729          return ret;
>    730  }
>    731
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
