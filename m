Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E78D3162449
	for <lists+linux-remoteproc@lfdr.de>; Tue, 18 Feb 2020 11:10:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgBRKKI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 18 Feb 2020 05:10:08 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:32990 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbgBRKKI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 18 Feb 2020 05:10:08 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 58F4927E1650;
        Tue, 18 Feb 2020 11:10:05 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id aBAB94zh_Hyx; Tue, 18 Feb 2020 11:10:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 57B7E27E058F;
        Tue, 18 Feb 2020 11:10:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id R7WFYViiMMDj; Tue, 18 Feb 2020 11:10:04 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 32F1A27E1650;
        Tue, 18 Feb 2020 11:10:04 +0100 (CET)
Date:   Tue, 18 Feb 2020 11:10:04 +0100 (CET)
From:   =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalrayinc.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        linux-doc <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>
Message-ID: <838984434.4934674.1582020604015.JavaMail.zimbra@kalray.eu>
In-Reply-To: <CANLsYkzK1Sd1dtNZy-bv6eZf5CjJNsOrpaVVYU=ww3n398NzYw@mail.gmail.com>
References: <527785289.2852303.1581062223707.JavaMail.zimbra@kalray.eu> <20200210162209.23149-1-cleger@kalray.eu> <20200210162209.23149-2-cleger@kalray.eu> <4465bade-e3de-88b8-63a5-e5410de9adc0@st.com> <884697376.3644142.1581439161953.JavaMail.zimbra@kalray.eu> <20200211223715.GA27770@xps15> <296765414.3763778.1581503820255.JavaMail.zimbra@kalray.eu> <CANLsYkzK1Sd1dtNZy-bv6eZf5CjJNsOrpaVVYU=ww3n398NzYw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] remoteproc: Use u64 len for da_to_va
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [192.168.40.202]
X-Mailer: Zimbra 8.8.15_GA_3895 (ZimbraWebClient - GC75 (Linux)/8.8.15_GA_3895)
Thread-Topic: remoteproc: Use u64 len for da_to_va
Thread-Index: Qhvxe95iDK5EsIjlyXH8etHXh1QScg==
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

----- On 12 Feb, 2020, at 22:59, Mathieu Poirier mathieu.poirier@linaro.org wrote:

> On Wed, 12 Feb 2020 at 03:37, Clément Leger <cleger@kalray.eu> wrote:
>>
>> Hi Mathieu,
>>
>> ----- On 11 Feb, 2020, at 23:37, Mathieu Poirier mathieu.poirier@linaro.org
>> wrote:
>>
>> > On Tue, Feb 11, 2020 at 05:39:21PM +0100, Clément Leger wrote:
>> >> Hi Arnaud,
>> >>
>> >> ----- On 11 Feb, 2020, at 16:53, Arnaud Pouliquen arnaud.pouliquen@st.com wrote:
>> >>
>> >> > On 2/10/20 5:22 PM, Clement Leger wrote:
>> >> >> With upcoming changes in elf loader for elf64 support, section size will
>> >> >> be a u64. When used with da_to_va, this will potentially lead to
>> >> >> overflow if using the current "int" type for len argument. Change
>> >> >> da_to_va prototype to use a u64 for len and fix all users of this
>> >> >> function.
>> >> >>
>> >> >> Signed-off-by: Clement Leger <cleger@kalray.eu>
>> >> >> ---
>> >> >>  drivers/remoteproc/imx_rproc.c           | 11 ++++++-----
>> >> >>  drivers/remoteproc/keystone_remoteproc.c |  4 ++--
>> >> >>  drivers/remoteproc/qcom_q6v5_adsp.c      |  2 +-
>> >> >>  drivers/remoteproc/qcom_q6v5_mss.c       |  2 +-
>> >> >>  drivers/remoteproc/qcom_q6v5_pas.c       |  2 +-
>> >> >>  drivers/remoteproc/qcom_q6v5_wcss.c      |  2 +-
>> >> >>  drivers/remoteproc/qcom_wcnss.c          |  2 +-
>> >> >>  drivers/remoteproc/remoteproc_core.c     |  2 +-
>> >> >>  drivers/remoteproc/remoteproc_internal.h |  2 +-
>> >> >>  drivers/remoteproc/st_slim_rproc.c       |  4 ++--
>> >> >>  drivers/remoteproc/wkup_m3_rproc.c       |  4 ++--
>> >> >>  include/linux/remoteproc.h               |  2 +-
>> >> >>  12 files changed, 20 insertions(+), 19 deletions(-)
>> >> >>
>> >> >> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>> >> >> index 3e72b6f38d4b..f497f5b49b18 100644
>> >> >> --- a/drivers/remoteproc/imx_rproc.c
>> >> >> +++ b/drivers/remoteproc/imx_rproc.c
>> >> >> @@ -186,7 +186,7 @@ static int imx_rproc_stop(struct rproc *rproc)
>> >> >>  }
>> >> >>
>> >> >>  static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
>> >> >> -                        int len, u64 *sys)
>> >> >> +                        u64 len, u64 *sys)
>> >> >>  {
>> >> >>   const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>> >> >>   int i;
>> >> >> @@ -203,19 +203,19 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64
>> >> >> da,
>> >> >>           }
>> >> >>   }
>> >> >>
>> >> >> - dev_warn(priv->dev, "Translation failed: da = 0x%llx len = 0x%x\n",
>> >> >> + dev_warn(priv->dev, "Translation failed: da = 0x%llx len = 0x%llx\n",
>> >> >>            da, len);
>> >> >>   return -ENOENT;
>> >> >>  }
>> >> >>
>> >> >> -static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>> >> >> +static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
>> >> >>  {
>> >> >>   struct imx_rproc *priv = rproc->priv;
>> >> >>   void *va = NULL;
>> >> >>   u64 sys;
>> >> >>   int i;
>> >> >>
>> >> >> - if (len <= 0)
>> >> >> + if (len == 0)
>> >> >>           return NULL;
>> >> >>
>> >> >>   /*
>> >> >> @@ -235,7 +235,8 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da,
>> >> >> int len)
>> >> >>           }
>> >> >>   }
>> >> >>
>> >> >> - dev_dbg(&rproc->dev, "da = 0x%llx len = 0x%x va = 0x%p\n", da, len, va);
>> >> >> + dev_dbg(&rproc->dev, "da = 0x%llx len = 0x%llx va = 0x%p\n",
>> >> >> +         da, len, va);
>> >> >>
>> >> >>   return va;
>> >> >>  }
>> >> >> diff --git a/drivers/remoteproc/keystone_remoteproc.c
>> >> >> b/drivers/remoteproc/keystone_remoteproc.c
>> >> >> index 5c4658f00b3d..466093f48814 100644
>> >> >> --- a/drivers/remoteproc/keystone_remoteproc.c
>> >> >> +++ b/drivers/remoteproc/keystone_remoteproc.c
>> >> >> @@ -246,7 +246,7 @@ static void keystone_rproc_kick(struct rproc *rproc, int
>> >> >> vqid)
>> >> >>   * can be used either by the remoteproc core for loading (when using kernel
>> >> >>   * remoteproc loader), or by any rpmsg bus drivers.
>> >> >>   */
>> >> >> -static void *keystone_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>> >> >> +static void *keystone_rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
>> >> >>  {
>> >> >>   struct keystone_rproc *ksproc = rproc->priv;
>> >> >>   void __iomem *va = NULL;
>> >> >> @@ -255,7 +255,7 @@ static void *keystone_rproc_da_to_va(struct rproc *rproc,
>> >> >> u64 da, int len)
>> >> >>   size_t size;
>> >> >>   int i;
>> >> >>
>> >> >> - if (len <= 0)
>> >> >> + if (len == 0)
>> >> >>           return NULL;
>> >> >>
>> >> >>   for (i = 0; i < ksproc->num_mems; i++) {
>> >> >> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c
>> >> >> b/drivers/remoteproc/qcom_q6v5_adsp.c
>> >> >> index e953886b2eb7..7518e67a49e5 100644
>> >> >> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
>> >> >> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
>> >> >> @@ -270,7 +270,7 @@ static int adsp_stop(struct rproc *rproc)
>> >> >>   return ret;
>> >> >>  }
>> >> >>
>> >> >> -static void *adsp_da_to_va(struct rproc *rproc, u64 da, int len)
>> >> >> +static void *adsp_da_to_va(struct rproc *rproc, u64 da, u64 len)
>> >> >>  {
>> >> >>   struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
>> >> >>   int offset;
>> >> >> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c
>> >> >> b/drivers/remoteproc/qcom_q6v5_mss.c
>> >> >> index 471128a2e723..248febde6fc1 100644
>> >> >> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> >> >> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> >> >> @@ -1148,7 +1148,7 @@ static int q6v5_stop(struct rproc *rproc)
>> >> >>   return 0;
>> >> >>  }
>> >> >>
>> >> >> -static void *q6v5_da_to_va(struct rproc *rproc, u64 da, int len)
>> >> >> +static void *q6v5_da_to_va(struct rproc *rproc, u64 da, u64 len)
>> >> >>  {
>> >> >>   struct q6v5 *qproc = rproc->priv;
>> >> >>   int offset;
>> >> >> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c
>> >> >> b/drivers/remoteproc/qcom_q6v5_pas.c
>> >> >> index db4b3c4bacd7..cf2cd609c90d 100644
>> >> >> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> >> >> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> >> >> @@ -159,7 +159,7 @@ static int adsp_stop(struct rproc *rproc)
>> >> >>   return ret;
>> >> >>  }
>> >> >>
>> >> >> -static void *adsp_da_to_va(struct rproc *rproc, u64 da, int len)
>> >> >> +static void *adsp_da_to_va(struct rproc *rproc, u64 da, u64 len)
>> >> >>  {
>> >> >>   struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
>> >> >>   int offset;
>> >> >> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c
>> >> >> b/drivers/remoteproc/qcom_q6v5_wcss.c
>> >> >> index f93e1e4a1cc0..3a6b82a16961 100644
>> >> >> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
>> >> >> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
>> >> >> @@ -406,7 +406,7 @@ static int q6v5_wcss_stop(struct rproc *rproc)
>> >> >>   return 0;
>> >> >>  }
>> >> >>
>> >> >> -static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, int len)
>> >> >> +static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, u64 len)
>> >> >>  {
>> >> >>   struct q6v5_wcss *wcss = rproc->priv;
>> >> >>   int offset;
>> >> >> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
>> >> >> index dc135754bb9c..f893219e45a8 100644
>> >> >> --- a/drivers/remoteproc/qcom_wcnss.c
>> >> >> +++ b/drivers/remoteproc/qcom_wcnss.c
>> >> >> @@ -287,7 +287,7 @@ static int wcnss_stop(struct rproc *rproc)
>> >> >>   return ret;
>> >> >>  }
>> >> >>
>> >> >> -static void *wcnss_da_to_va(struct rproc *rproc, u64 da, int len)
>> >> >> +static void *wcnss_da_to_va(struct rproc *rproc, u64 da, u64 len)
>> >> >>  {
>> >> >>   struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
>> >> >>   int offset;
>> >> >> diff --git a/drivers/remoteproc/remoteproc_core.c
>> >> >> b/drivers/remoteproc/remoteproc_core.c
>> >> >> index 307df98347ba..9e6d3c6a60ee 100644
>> >> >> --- a/drivers/remoteproc/remoteproc_core.c
>> >> >> +++ b/drivers/remoteproc/remoteproc_core.c
>> >> >> @@ -185,7 +185,7 @@ EXPORT_SYMBOL(rproc_va_to_pa);
>> >> >>   * here the output of the DMA API for the carveouts, which should be more
>> >> >>   * correct.
>> >> >>   */
>> >> >> -void *rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>> >> >> +void *rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
>> >> >
>> >> > This function is exported, don't see any update in consequence...
>> >> > references:
>> >> > https://elixir.bootlin.com/linux/v5.6-rc1/ident/rproc_da_to_va
>> >> > For instance the function rproc_trace_read use it. it quite strange that my gcc
>> >> > does not warns for the cast but i suppose that some could.
>> >>
>> >> Agreed, even if len should never have been a signed type since it can't be
>> >> negative. I will try to fix all callers.
>> >>
>> >> > An indirect consequence is that the len field in rproc_mem_entry struct should
>> >> > probably been updated to u64 to be aligned.
>> >>
>> >> Ok, I will do that once we settle on the type of len.
>> >>
>> >> >
>> >> > I'm still wondering about the use of size_t instead,which seems more rational
>> >> > from my window.
>> >> > So i you or Mathieu remember it was decided to use u64, please could remind me
>> >> > the arguments?
>> >>
>> >> I tried to find the notes of a meeting we had for OpenAMP but I did not found
>> >> them. Anyway, the argument was coming from Tomas or someone else, (I can't
>> >> remember) talking about a 32 bits CPU executing code on a 64 bits accelerator.
>> >> In that case, the size_t type could fail due to being only 32bits on the host
>> >> CPU but larger than 4G.
>> >>
>> >> However, I can't say if it's a real usecase or not... All I can say is
>> >> that keeping it open is probably better if one day somebody comes with such
>> >> architecture.
>> >
>> > In order to support a 32bit AP with a 64bit MCU we'd also have to deal with all
>> > the dma_attr_t in the structure we use.
>>
>> Totally ok with that...
>>
>> >
>> > Also something that became very clear to me while thinking about this patchset
>> > is that supporting elf64 does __not__ mean we support 64bit MCU.  As long as
>> > the addresses conveyed by the elf64 image fit within 32 bits we are fine.
>> > Supporting 64bit MCUs is a completely different topic, one that will demand
>> > serious refactoring.
>>
>> Exactly, an elf64 can potentially contain an executable fitting in 32 bits.
>>
>> >
>> > So moving from "int len" to "u64 len" doesn't give us much.  It doesn't hurt to
>> > do it but if @len ever becomes bigger than 31 bits we'll have other problems to
>> > deal with.
>>
>> Agreed, so what would be your recommendation reagrding the type of len ?
>> I'm ok with Arnaud statement too and using a size_t is probably more
>> "type-safe" than a u64. At least it adds some information.
> 
> If @len becomes big enough that it doesn't fit in 31bit then it is
> very likely that things will break even before we get to call
> rproc_da_to_va().  Fixing it here is possible but will introduce a
> fair amount of ripple effect that we probably don't want to deal with
> right now.

I did the modification using u64 and tried to follow various code path.
Some end up in dma_alloc_coherent which uses a size_t member. Since
these might be called by rproc with a u64 len, I would be more
inclined to use a size_t. I can probably also add a check in elf loader
which verifies that if sizeof(size_t) < sizeof(u64), then the len must
fit in 32bits. This seems more clean IMHO.

Clément.

> 
> Other people might feel more opinionated on this but as far as I'm
> concerned, I would keep it as it is and fix it for real when the time
> comes to add support for 64bit MCUs.
> 
>>
>> Thanks,
>>
>> Clément
>>
>> >
>> >>
>> >> > As an alternative a check should be added for 32 bits processors to ensure that
>> >> > the size is not higher than
>> >> > its address range capability...
>> >>
>> >> Agreed.
>> >> I was even thinking about a mecanism for remoteproc drivers to declare the type
>> >> of supported elfs files (such as EM_*, ELFCLASS* and other needed thing).
>> >> Or should it be supported by overriding .sanity_check in drivers  to reject
>> >> elf64 for instance ?
>> >>
>> >> Since elf is a "specific format" and that rproc can support other formats,
>> >> I did not want to add a specific elf_sanity_check field to rproc ops.
>> >>
>> >> Regards,
>> >>
>> >> Clément
>> >>
>> >> >
>> >> > Regards
>> >> > Arnaud
>> >> >
>> >> >>  {
>> >> >>   struct rproc_mem_entry *carveout;
>> >> >>   void *ptr = NULL;
>> >> >> diff --git a/drivers/remoteproc/remoteproc_internal.h
>> >> >> b/drivers/remoteproc/remoteproc_internal.h
>> >> >> index 493ef9262411..004867061721 100644
>> >> >> --- a/drivers/remoteproc/remoteproc_internal.h
>> >> >> +++ b/drivers/remoteproc/remoteproc_internal.h
>> >> >> @@ -50,7 +50,7 @@ void rproc_exit_sysfs(void);
>> >> >>  void rproc_free_vring(struct rproc_vring *rvring);
>> >> >>  int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
>> >> >>
>> >> >> -void *rproc_da_to_va(struct rproc *rproc, u64 da, int len);
>> >> >> +void *rproc_da_to_va(struct rproc *rproc, u64 da, u64 len);
>> >> >>  phys_addr_t rproc_va_to_pa(void *cpu_addr);
>> >> >>  int rproc_trigger_recovery(struct rproc *rproc);
>> >> >>
>> >> >> diff --git a/drivers/remoteproc/st_slim_rproc.c
>> >> >> b/drivers/remoteproc/st_slim_rproc.c
>> >> >> index 04492fead3c8..fc01cd879b60 100644
>> >> >> --- a/drivers/remoteproc/st_slim_rproc.c
>> >> >> +++ b/drivers/remoteproc/st_slim_rproc.c
>> >> >> @@ -174,7 +174,7 @@ static int slim_rproc_stop(struct rproc *rproc)
>> >> >>   return 0;
>> >> >>  }
>> >> >>
>> >> >> -static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>> >> >> +static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
>> >> >>  {
>> >> >>   struct st_slim_rproc *slim_rproc = rproc->priv;
>> >> >>   void *va = NULL;
>> >> >> @@ -191,7 +191,7 @@ static void *slim_rproc_da_to_va(struct rproc *rproc, u64
>> >> >> da, int len)
>> >> >>           }
>> >> >>   }
>> >> >>
>> >> >> - dev_dbg(&rproc->dev, "da = 0x%llx len = 0x%x va = 0x%pK\n",
>> >> >> + dev_dbg(&rproc->dev, "da = 0x%llx len = 0x%llx va = 0x%pK\n",
>> >> >>           da, len, va);
>> >> >>
>> >> >>   return va;
>> >> >> diff --git a/drivers/remoteproc/wkup_m3_rproc.c
>> >> >> b/drivers/remoteproc/wkup_m3_rproc.c
>> >> >> index 3984e585c847..91485b467407 100644
>> >> >> --- a/drivers/remoteproc/wkup_m3_rproc.c
>> >> >> +++ b/drivers/remoteproc/wkup_m3_rproc.c
>> >> >> @@ -80,14 +80,14 @@ static int wkup_m3_rproc_stop(struct rproc *rproc)
>> >> >>   return 0;
>> >> >>  }
>> >> >>
>> >> >> -static void *wkup_m3_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>> >> >> +static void *wkup_m3_rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
>> >> >>  {
>> >> >>   struct wkup_m3_rproc *wkupm3 = rproc->priv;
>> >> >>   void *va = NULL;
>> >> >>   int i;
>> >> >>   u32 offset;
>> >> >>
>> >> >> - if (len <= 0)
>> >> >> + if (len == 0)
>> >> >>           return NULL;
>> >> >>
>> >> >>   for (i = 0; i < WKUPM3_MEM_MAX; i++) {
>> >> >> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> >> >> index 16ad66683ad0..f84bd5fe0211 100644
>> >> >> --- a/include/linux/remoteproc.h
>> >> >> +++ b/include/linux/remoteproc.h
>> >> >> @@ -374,7 +374,7 @@ struct rproc_ops {
>> >> >>   int (*start)(struct rproc *rproc);
>> >> >>   int (*stop)(struct rproc *rproc);
>> >> >>   void (*kick)(struct rproc *rproc, int vqid);
>> >> >> - void * (*da_to_va)(struct rproc *rproc, u64 da, int len);
>> >> >> + void * (*da_to_va)(struct rproc *rproc, u64 da, u64 len);
>> >> >>   int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
>> >> >>   int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
> > > > >>                            int offset, int avail);
